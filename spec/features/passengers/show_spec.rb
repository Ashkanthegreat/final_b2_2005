require 'rails_helper'

RSpec.describe "Passengers Show Page" do
  describe "When I visit a passengers show page" do
    it "can see a passengers name and all flight numbers for that passenger" do
      frontier = Airline.create(name: "Frontier")

      reno = frontier.flights.create(number: "1550", date: "08/03/20", time: "1800", depar_city: "Denver", arrive_city: "Reno")
      vegas = frontier.flights.create(number: "1221", date: "08/05/20", time: "1800", depar_city: "Reno", arrive_city: "Las Vegas")

      jim = Passenger.create(name: "Jim", age: 40)

      FlightPassenger.create!(flight: reno, passenger: jim)
      FlightPassenger.create!(flight: vegas, passenger: jim)

      visit "/passengers/#{jim.id}"
      expect(page).to have_content(jim.name)
      expect(page).to have_link("1550")
      expect(page).to have_link("1221")

      click_on "1550"
      expect(current_path).to eq("/flights/#{reno.id}")
    end
  end
  describe "Passenger can add a flight" do
    it "can see a form to add flight" do
      frontier = Airline.create(name: "Frontier")

      reno = frontier.flights.create(number: "1550", date: "08/03/20", time: "1800", depar_city: "Denver", arrive_city: "Reno")
      vegas = frontier.flights.create(number: "1221", date: "08/05/20", time: "1800", depar_city: "Reno", arrive_city: "Las Vegas")

      jim = Passenger.create(name: "Jim", age: 40)

      FlightPassenger.create!(flight: vegas, passenger: jim)

      visit "/passengers/#{jim.id}"

      fill_in :number, with: "1550"
      click_on "Add Flight"

      expect(current_path).to eq("/passengers/#{jim.id}")

      expect(page).to have_link("1550")
    end
  end
end
# I see a form to add a flight
# When I fill in the form with a flight number (assuming these will always be unique)
# And click submit
# I'm taken back to the passengers show page
# And I can see the flight number of the flight I just added
