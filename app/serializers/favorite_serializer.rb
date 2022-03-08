class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :show

  # belongs_to :user # displays user data too
end
