require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships'do
    it {should have_many :flights}
    it {should have_many(:flights).through(:flight_passengers)}
  end

  describe 'methods' do
    before :each do
      @jim = Passenger.create(name: "Jim", age: 40)
      @barb = Passenger.create(name: "Barbara", age: 35)
      @jim_jr = Passenger.create(name: "Jim Jr", age: 15)
    end

    it "#minors" do
      expect(Passenger.minors).to eq(1)
    end

    it "#adults" do
      expect(Passenger.adults).to eq(2)
    end
  end
end
