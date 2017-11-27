class BuddiesController < ApplicationController

  def index
    buddies = Buddy.where(trip_id: params[:trip_id])

    user_names = NameLookup.names(buddies)

    buddies = buddies.map do |buddy|
      name = user_names[buddy.user_id.to_s]
      # attributes comes from active record
      buddy.attributes.merge({name: name})
    end

    render json: buddies
  end

  def create
    trip = Trip.find(params[:trip_id])
    buddy = trip.buddies.create!(user_id: current_user["id"])

    # 204 response
    head :no_content
  end
end
