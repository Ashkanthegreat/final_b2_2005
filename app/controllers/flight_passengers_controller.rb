class FlightPassengersController < ApplicationController
  def create
    flight = Flight.where(number: params[:number]).first
    FlightPassenger.create(flight: flight, passenger_id: params[:passenger_id])
    redirect_to "/passengers/#{params[:passenger_id]}"
  end
end
