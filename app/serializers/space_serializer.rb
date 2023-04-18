class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :location, :admin_id
end
