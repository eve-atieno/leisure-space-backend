class Review < ApplicationRecord
  belongs_to :space
  belongs_to :profile

  validates :rating , presence: true
end
