class AdminSerializer < ActiveModel::Serializer
  attributes :name, :email, :password
end
