class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :location, :category, :admin_id, :media, :reviews
end
