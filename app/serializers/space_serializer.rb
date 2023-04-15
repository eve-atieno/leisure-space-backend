class SpaceSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url, :price, :location
end
