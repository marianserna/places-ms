class BuddiesController < ApplicationController

  def index
    buddies = Buddy.where(trip_id: params[:trip_id])

    buddies = buddies.map do |buddy|
      # attributes comes from active record
      buddy.attributes.merge({name: buddy.user_name})
    end

    render json: buddies
  end

  def create
    trip = Trip.find(params[:trip_id])
    buddy = trip.buddies.create!(user_id: current_user["id"], color: Buddy::DEFAULT_COLORS.sample)

    # 204 response
    head :no_content
  end
end
