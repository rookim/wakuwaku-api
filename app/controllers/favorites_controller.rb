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
    if Favorite.exists?(user_id: current_user.id, tvmaze_id: params[:tvmaze_id])
      render json: {message: "This anime has already been added to your Favorites... ;-;"}, status: :bad_request
    else
      favorite.save
      render json: {message: "Anime has been successfully added to your Favorites! ㅇㅂㅇ"}
    end
  end

  def destroy
    if Favorite.exists?(params[:id])
      favorite = Favorite.find(params[:id])
      favorite.destroy
      render json: {message: "Successfully removed from your Favorites..."}
    else
      render json: {message: "Could not be found..."}, status: :not_found
    end
  end

end
