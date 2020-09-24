class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :coffee_shop
  # has_one :user
  # has_one :coffee_shop
end
