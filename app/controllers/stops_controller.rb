class StopsController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    stop = trip.stops.create!(place_id: params[:place_id])

    render json: stop.place
  end

  def index
    stops = Stop.where(trip_id: params[:trip_id])
    render json: stops.map { |stop| stop.place }
  end

  def destroy

  end

end