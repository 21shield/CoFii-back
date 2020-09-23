class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_name
  
  # has_one :user
  # has_one :coffee_shop
end
