class TripsController < ApplicationController

  def create
    trip = Trip.new(trip_params)
    trip.user_id = current_user["id"]
    # raise trip.inspect
    trip.save

    render json: trip
  end

  private

  def trip_params
    params.require(:trip).permit(:name)
  end
end
