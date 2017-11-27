class MessagesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    recent_messages = trip.messages.last(20)

    render json: recent_messages
  end
end