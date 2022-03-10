class AnimesController < ApplicationController

  def index
    # maybe only allow search for currently airing anime? LOOK AT API
    response = HTTP.get("https://api.tvmaze.com/search/shows?q=#{params[:title]}")

    shows = response.parse(:json)
    animes = []
    # only take the anime shows that are still currently running and put it in the animes array
    shows.each do |show|
      if show["show"]["type"] == "Animation" && show["show"]["status"] == "Running" && show["show"]["_links"]["nextepisode"]
        animes << show
      end
    end
    if current_user
      animes.each do |anime|
        anime[:favorited] = Favorite.exists?(user_id: current_user.id, tvmaze_id: anime["show"]["id"])
        if anime[:favorited] == true
          id = Favorite.find_by(user_id: current_user.id, tvmaze_id: anime["show"]["id"])
          anime[:favoritesId] = id[:id]
        end
      end  
    end

    render json: animes
  end
  
  def show
    response = HTTP.get("https://api.tvmaze.com/shows/#{params[:id]}")
    
    # for now, raw body data; can parse later
    render json: response.parse(:json)
  end

end
