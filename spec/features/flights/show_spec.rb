require 'rails_helper'

RSpec.describe "Flights Show Page" do
  describe "When I visit a flights show page" do
    it "can see a flights info, the airline it belongs to, and all of the passengers on the flight" do
      frontier = Airline.create(name: "Frontier")

      reno = frontier.flights.create(number: "1550", date: "08/03/20", time: "1800", depart_city: "Denver", arrive_city: "Reno")

      jim = Passenger.create(name: "Jim", age: 40)
      jim_jr = Passenger.create(name: "Jim Jr", age: 15)

      
    end

  end
end

# User Story 1, Flights Show Page
# ​
# As a visitor
# When I visit a flights show page
# I see all of that flights information including:
#   - number
#   - date
#   - time
#   - departure city
#   - arrival city
# And I see the name of the airline this flight belongs
# And I see the names of all of the passengers on this flight
# ```
​
