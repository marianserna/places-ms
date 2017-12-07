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
    create_video_room(trip)

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

  def video_token
    # https://www.twilio.com/docs/api/video/identity
    # create access token
    token = Twilio::JWT::AccessToken.new(ENV.fetch("TWILIO_ACCOUNT_SID"), ENV.fetch("TWILIO_VIDEO_SID"), ENV.fetch("TWILIO_VIDEO_SECRET"), current_user["id"])

    # video grant for token
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    token.add_grant(grant)

    render json: {token: token.to_jwt}
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :completed_at, :rating)
  end

  def create_video_room(trip)
    client = Twilio::REST::Client.new ENV.fetch("TWILIO_VIDEO_SID"), ENV.fetch("TWILIO_VIDEO_SECRET")

    p2p_room = client.video.rooms.create(
      unique_name: trip.uuid,
      type: 'peer-to-peer',
      enable_turn: true
    )
  end
end
