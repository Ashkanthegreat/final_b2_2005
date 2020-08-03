class FlightPassengersController < ApplicationController
  def create
    flight = Flight.where(number: params[:number]).first
    flight_passenger = FlightPassenger.where(flight: flight, passenger_id: params[:passenger_id]).first
    if flight.nil?
      flash[:error] = "The flight number you entered does not exist"
    else flight_passenger.nil? && Flight.exists?(flight.id)
      FlightPassenger.create(flight: flight, passenger_id: params[:passenger_id])
    end
    redirect_to "/passengers/#{params[:passenger_id]}"
  end
end
