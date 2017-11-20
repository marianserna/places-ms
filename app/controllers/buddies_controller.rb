class BuddiesController < ApplicationController

  def create
    trip = Trip.find(params[:trip_id])
    buddy = trip.buddies.create!(user_id: current_user["id"])

    # 204 response
    head :no_content
  end
end
