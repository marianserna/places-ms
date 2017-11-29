class TripChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_#{params[:trip_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def talk(data)
    trip = Trip.find(params[:trip_id])
    message = trip.messages.create!({user_id: data["user_id"], text: data["text"]})

    message_attributes = message.attributes.merge({name: message.user_name})

    ActionCable.server.broadcast("trip_#{params[:trip_id]}", {type: 'new_message', data: message_attributes})
  end
end
