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
    user_id = current_user.id
    # grab tvmaze id of anime 


    favorite = Favorite.new(
      user_id: user_id,
      tvmaze_id:  
    )
    if favorite.save
      render json: {favorite, message: "Anime has been successfully added to favorites"}
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    # idk if this is right
    favorite = Favorite.find(params[:id])
    if favorite.destroy
      render json {message: "Anime has been successfully removed from your favorites..."}
    else
      # what error would i render?
      render json {}, status: :internal_server_error
    end
  end

end
