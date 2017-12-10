class StopsController < ApplicationController
  def create
    trip = Trip.find_by(uuid: params[:trip_uuid])
    stop = trip.stops.create!(place_id: params[:place_id], user_id: current_user["id"])

    stop_attributes = ActiveModelSerializers::SerializableResource.new(
      stop
    ).serializable_hash

    ActionCable.server.broadcast("trip_#{trip.uuid}", {type: 'new_stop', data: stop_attributes})

    render json: stop
  end

  def index
    trip = Trip.find_by(uuid: params[:trip_uuid])
    stops = trip.stops

    render json: stops
  end

  def destroy
    trip = Trip.find_by(uuid: params[:trip_uuid])
    stop = Stop.find(params[:id])
    ActionCable.server.broadcast("trip_#{trip.uuid}", {type: 'remove_stop', data: stop.id})
    stop.destroy

    head :no_content
  end

end