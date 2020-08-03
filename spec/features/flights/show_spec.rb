require 'rails_helper'

RSpec.describe "Flights Show Page" do
  describe "When I visit a flights show page" do
    it "can see a flights info, the airline it belongs to, and all of the passengers on the flight" do
      frontier = Airline.create(name: "Frontier")

      reno = frontier.flights.create(number: "1550", date: "08/03/20", time: "1800", depar_city: "Denver", arrive_city: "Reno")

      jim = Passenger.create(name: "Jim", age: 40)
      jim_jr = Passenger.create(name: "Jim Jr", age: 15)

      FlightPassenger.create!(flight: reno, passenger: jim)
      FlightPassenger.create!(flight: reno, passenger: jim_jr)

      visit "/flights/#{reno.id}"

      expect(page).to have_content(reno.number)
      expect(page).to have_content(reno.date)
      expect(page).to have_content(reno.time)
      expect(page).to have_content(reno.depar_city)
      expect(page).to have_content(reno.arrive_city)
      expect(page).to have_content("Frontier")
      expect(page).to have_content("Jim")
      expect(page).to have_content("Jim Jr")
    end
  end
end
