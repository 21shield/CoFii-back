class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :external_id, :name, :image_url, :url, :rating,:latitude, :longitude, :location, :comments
  
end
