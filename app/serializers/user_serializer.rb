class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :bio, :avatar
  has_many :favorites
end
