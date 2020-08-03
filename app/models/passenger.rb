class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.minors
    Passenger.where('age < ?', 18).count
  end

  def self.adults
    Passenger.where('age >= ?', 18).count
  end
end
