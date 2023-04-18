class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :profile_picture, :user_id
end
