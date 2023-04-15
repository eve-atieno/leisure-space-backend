class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :password_digest
end
