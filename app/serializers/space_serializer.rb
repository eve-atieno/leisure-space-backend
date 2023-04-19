class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :price, :location
end
