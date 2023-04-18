class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :profile

  
end
