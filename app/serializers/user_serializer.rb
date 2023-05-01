class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :password_confirmation, :name
  belongs_to :profile
end
