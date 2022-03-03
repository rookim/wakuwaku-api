class AnimesController < ApplicationController

  def index
    # maybe only allow search for currently airing anime?
    response = HTTP.get("https://api.tvmaze.com/search/shows?q=#{params[:title]}")

    # for now, raw body data; can parse later
    animes = response.parse(:json)
    render json: animes
  end

  def show
    response = HTTP.get("https://api.tvmaze.com/shows/#{params[:id]}")
    
    # for now, raw body data; can parse later
    render json: response.parse(:json)
  end

end
