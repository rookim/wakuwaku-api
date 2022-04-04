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
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    render json: current_user
  end

  def update
    user = current_user
    user.email = params[:email] || user.email
    user.username = params[:username] || user.username
    user.phone_number = params[:phone_number] || user.phone_number
    user.password = params[:password] || user.password
    user.password_confirmation = params[:password_confirmation] || user.password_confirmation
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    current_user.destroy
    render json: {message: "User was successfully deleted...."}
  end

end
