class Favorite < ApplicationRecord
  belongs_to :user

  # custom association instead of having belongs_to :anime
  def tvmaze_anime
    response = HTTP.get("https://api.tvmaze.com/shows/#{tvmaze_id}")

    anime = response.parse(:json)
    return {
      id: anime["id"],
      name: anime["name"],
      status: anime["status"],
      premiered: anime["premiered"],
      officialSite: anime["officialSite"],
      image: anime["image"]["medium"],
      summary: anime["summary"],
      prev_ep_link: anime["_links"]["previousepisode"],
      next_ep_link: anime["_links"]["nextepisode"]
    }
  end
end
