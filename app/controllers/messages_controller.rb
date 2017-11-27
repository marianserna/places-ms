class MessagesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    recent_messages = trip.messages.last(20)

    user_names = NameLookup.names(recent_messages)

    recent_messages = recent_messages.map do |recent_msg|
      name = user_names[recent_msg.user_id.to_s]
      # attributes comes from active record
      recent_msg.attributes.merge({name: name})
    end

    render json: recent_messages
  end
end