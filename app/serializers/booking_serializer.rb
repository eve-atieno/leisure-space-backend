class BookingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :profile_id, :space_id
  belongs_to :profile
  belongs_to :space
end
