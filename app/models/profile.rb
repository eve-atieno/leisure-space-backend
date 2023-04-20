class Profile < ApplicationRecord

    belongs_to :user
    has_many :bookings
    has_many :spaces, through: :bookings
    has_many :reviews
    has_many :spaces, through: :reviews
    
end
