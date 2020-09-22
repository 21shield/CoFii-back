class CommentSerializer < ActiveModel::Serializer
  attributes :content, :user
  has_one :user
  has_one :coffee_shop
end
