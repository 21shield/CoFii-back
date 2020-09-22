class CommentSerializer < ActiveModel::Serializer
  attributes :content, :user_name
  has_one :user
  has_one :coffee_shop
end
