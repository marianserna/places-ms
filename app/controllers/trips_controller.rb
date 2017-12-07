class TripsController < ApplicationController

  def index
    trip_ids = Buddy.where(user_id: current_user["id"]).pluck(:trip_id)
    trips = Trip.where(id: trip_ids)

    render json: trips
  end

  def create
    trip = Trip.new(trip_params)
    trip.user_id = current_user["id"]
    trip.save

    buddy = trip.buddies.create!(user_id: current_user["id"])

    render json: trip
  end

  def show
    trip = Trip.find(params[:id])

    render json: trip
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)

    render json: trip
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :completed_at, :rating)
  end
end
