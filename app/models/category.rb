class Category < ApplicationRecord
    validates :name, presence: true

    has_many :spaces, dependent: :destroy
end