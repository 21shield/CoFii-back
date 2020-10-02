class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :image_url,:categories, :url, :rating,:latitude, :longitude, :location, :distance, :comments

  # has_many :comments
end
