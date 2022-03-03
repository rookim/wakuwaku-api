class FavoritesController < ApplicationController
  before_action :authenticate_user, except: [:index]
  
  def index
    if current_user
      user = User.find(current_user.id)
      favorites = user.favorites
      # renders a list of hashes
      render json: favorites
    else
      render json: {message: "Log in please! ^__^"}
    end
  end

  def create
    favorite = Favorite.new(
      user_id: current_user.id,
      # this info is being sent from the frontend?
      tvmaze_id: params[:tvmaze_id]
    )
    if favorite.save
      render json: {message: "Anime has been successfully added to favorites"}
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    # idk if this is right
    favorite = Favorite.find(params[:id])
    if favorite.destroy
      render json: {message: "Anime has been successfully removed from your favorites..."}
    else
      # maybe a user is trying to delete a favorites item that doesn't exist
      render json: {}, status: :bad_request
    end
  end

end
