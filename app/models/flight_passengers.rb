class FlightPassenger < ApplicationRecord
  belong_to :flight
  belongs_to :passenger
end
