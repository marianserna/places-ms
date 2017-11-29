class StopsController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    stop = trip.stops.create!(place_id: params[:place_id], user_id: current_user["id"])
    place_attributes = stop.place.attributes.merge({
      user_name: NameLookup.name(stop.user_id),
      color: trip.buddies.find_by(user_id: stop.user_id).color
    })

    ActionCable.server.broadcast("trip_#{params[:trip_id]}", {type: 'new_stop', data: place_attributes})

    render json: stop.place
  end

  def index
    trip = Trip.find(params[:trip_id])
    stops = Stop.where(trip_id: params[:trip_id])

    places_attributes = stops.map do |stop| 
      # attributes comes from active record
      stop.place.attributes.merge({
        user_name: stop.user_name,
        color: trip.buddies.find_by(user_id: stop.user_id).color
      })
    end

    render json: places_attributes
  end

  def destroy

  end

end