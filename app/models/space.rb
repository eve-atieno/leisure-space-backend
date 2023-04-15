class Space < ApplicationRecord
    has_many :bookings
    has_many :reviews, through: :users
    belongs_to :admin
    has_many :galleries
end
