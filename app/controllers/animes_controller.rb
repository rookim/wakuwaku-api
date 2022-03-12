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
    
    # add airtime and airdate for each anime
    if animes
      animes.each do |anime|
        ep_link = anime["show"]["_links"]["nextepisode"]["href"]
        response2 = HTTP.get(ep_link)
        next_ep_info = response2.parse(:json)
  
        anime[:next_ep] = next_ep_info
      end
    end

    if current_user
      animes.each do |anime|
        # setting a favorited key for every anime shown (and sending to frontend anime objects that all have this key value pair)
        anime[:favorited] = Favorite.exists?(user_id: current_user.id, tvmaze_id: anime["show"]["id"])
        if anime[:favorited] == true
          id = Favorite.find_by(user_id: current_user.id, tvmaze_id: anime["show"]["id"])
          anime[:favoritesId] = id[:id]
        end
      end  
    end

    render json: animes
  end
  
  # def show
  #   anime = HTTP.get("https://api.tvmaze.com/shows/#{params[:id]}")
    
  #   # for now, raw body data; can parse later
  #   render json: anime.parse(:json)
  # end

end
