class Space < ApplicationRecord
    belongs_to :admin
    has_many :bookings
    has_many :profiles, through: :bookings
    has_many :reviews
    has_many :profiles, through: :reviews
    has_many :media
end
