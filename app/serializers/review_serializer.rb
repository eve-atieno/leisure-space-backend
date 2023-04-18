class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :profile_id, :space_id
end
