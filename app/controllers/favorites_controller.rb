class FavoritesController < ApplicationController
  before_action :authenticate_user
  
  def index
    render json: current_user.favorites
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
      render json: favorite, status: :created
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
