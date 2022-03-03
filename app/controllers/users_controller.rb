class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def create
    user = User.new(
      email: params[:email],
      username: params[:username],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    if user.id == current_user.id
      render json: user
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.email = params[:email] || user.email
      user.username = params[:username] || user.username
      user.phone_number = params[:phone_number] || user.phone_number
      user.password = params[:password] || user.password
      user.password_confirmation = params[:password_confirmation] || user.password_confirmation
        if user.save
          render json: { message: "User info updated successfully" }
        else
          render json: {errors: user.errors.full_messages}, status: :bad_request
        end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    current_user.destroy
    render json: {message: "User was successfully deleted...."}
  end

end
