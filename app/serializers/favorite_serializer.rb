class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tvmaze_id
end
