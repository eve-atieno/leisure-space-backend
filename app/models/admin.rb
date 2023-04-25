class Admin < ApplicationRecord
    has_secure_password
    has_many :spaces

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
    


end
