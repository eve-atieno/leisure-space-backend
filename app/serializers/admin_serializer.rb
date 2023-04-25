class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name
end
