class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :bio, :avatar
end
