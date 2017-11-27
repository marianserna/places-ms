class MessagesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    recent_messages = trip.messages.last(20)

    user_ids = recent_messages.map do |msg|
      msg.user_id
    end

    response = HTTParty.post(
      'http://localhost:4000/users/names', 
      body: {ids: user_ids}.to_json,
      headers: {'Content-Type' => 'application/json'}
    )
    # data looks like: {1: "Bob", 2: "Alanis"}
    user_names = JSON.parse(response.body)
    
    recent_messages = recent_messages.map do |recent_msg|
      name = user_names[recent_msg.user_id.to_s]
      # attributes comes from active record
      recent_msg.attributes.merge({name: name})
    end

    render json: recent_messages
  end
end