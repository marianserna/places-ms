class TripsController < ApplicationController

  def index
  # SELECT * FROM trips
  # WHERE user_id = 9
  # OR id IN (
  # 	SELECT trip_id FROM buddies
  # 	WHERE user_id = 9
  # )

    trip_ids = Buddy.where(user_id: current_user["id"]).pluck(:trip_id)
    trips = Trip.
      where("user_id = ? OR id IN (?)", current_user["id"], trip_ids)

    render json: trips
  end

  def create
    trip = Trip.new(trip_params)
    trip.user_id = current_user["id"]
    trip.save

    render json: trip
  end

  def show
    trip = Trip.find(params[:id])

    render json: trip
  end

  private

  def trip_params
    params.require(:trip).permit(:name)
  end
end
