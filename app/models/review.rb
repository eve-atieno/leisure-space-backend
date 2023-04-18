class Review < ApplicationRecord

    belongs_to :profile
    belongs_to :space

    validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

end
