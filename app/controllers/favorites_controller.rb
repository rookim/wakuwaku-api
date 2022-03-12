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
      # # grab next episode deets
      # next_episode = favorite.show[:next_ep]
      # # ping Twilio API
      # client = Twilio::REST::Client.new Rails.application.credentials.twilio_api.account_sid, Rails.application.credentials.twilio_api.auth_token
      # message = client.messages.create(
      #   body: "Episode #{next_episode["number"]} of #{favorite.show[:name]} is airing #{next_episode["airdate"]} at #{next_episode["airtime"]}",
      #   to: "+1#{favorite.user["phone_number"]}",
      #   from: "+#{Rails.application.credentials.twilio_api.phone_number}"
      # )
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
