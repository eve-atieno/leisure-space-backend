class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_picture, :description
end
