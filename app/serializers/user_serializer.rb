class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :avatar
  has_many :favorites
end
