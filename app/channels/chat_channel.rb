class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:trip_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def talk(data)
    trip = Trip.find(params[:trip_id])
    message = trip.messages.create!({user_id: data["user_id"], text: data["text"]})

    ActionCable.server.broadcast("chat_#{params[:trip_id]}", message.attributes.merge({name: 'Pablito'}))
  end
end
