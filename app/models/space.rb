class Space < ApplicationRecord
    # belongs_to :admin
    has_many :bookings
    has_many :reviews
    has_many :medias
end
