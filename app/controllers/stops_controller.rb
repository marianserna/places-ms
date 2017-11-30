class StopsController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    stop = trip.stops.create!(place_id: params[:place_id], user_id: current_user["id"])

    stop_attributes = ActiveModelSerializers::SerializableResource.new(
      stop
    ).serializable_hash

    ActionCable.server.broadcast("trip_#{params[:trip_id]}", {type: 'new_stop', data: stop_attributes})

    render json: stop
  end

  def index
    trip = Trip.find(params[:trip_id])
    stops = Stop.where(trip_id: params[:trip_id])

    render json: stops
  end

  def destroy
    stop = Stop.find(params[:id])
    ActionCable.server.broadcast("trip_#{params[:trip_id]}", {type: 'remove_stop', data: stop.id})
    stop.destroy

    head :no_content
  end

end