class User < ApplicationRecord
    has_secure_password
    has_many :bookings
    has_many :spaces, through: :bookings
    has_many :reviews

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
end
