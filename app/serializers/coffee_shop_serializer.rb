class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :rating, :coordinates, :location, :price
end
