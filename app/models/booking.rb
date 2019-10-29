class Booking < ApplicationRecord
  has_many :flights
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers
end
