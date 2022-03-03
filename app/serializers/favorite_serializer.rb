class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :tvmaze_anime

  # belongs_to :user # displays user data too
end
