class Favorite < ApplicationRecord
  belongs_to :user

  # custom association instead of having belongs_to :anime
  # named it show to make use of SeeAnime.vue component in frontend
  def show
    response = HTTP.get("https://api.tvmaze.com/shows/#{tvmaze_id}")
    anime = response.parse(:json)

    if anime["_links"]["nextepisode"].present?
      next_ep = anime["_links"]["nextepisode"]["href"]
      response2 = HTTP.get(next_ep)
      next_ep_info = response2.parse(:json)
    else
      next_ep_info = ""
    end

    return {
      id: anime["id"],
      name: anime["name"],
      status: anime["status"],
      premiered: anime["premiered"],
      officialSite: anime["officialSite"],
      image: anime["image"],
      summary: anime["summary"],
      prev_ep_link: anime["_links"]["previousepisode"]["href"],
      next_ep: next_ep_info
    }
  end
end
