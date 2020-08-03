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
end
# User Story 2, Passenger Show Page
# ​
# As a visitor
# When I visit a passengers show page
# I see that passengers name
# And I see a section of the page that displays all flight numbers of the flights for that passenger
# All flight numbers are links to that flight’s show page
# ```
