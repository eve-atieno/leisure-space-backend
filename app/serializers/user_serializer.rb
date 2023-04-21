class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :is_active
end
