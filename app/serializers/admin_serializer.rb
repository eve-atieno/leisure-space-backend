class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :password_confirmation, :name
end
