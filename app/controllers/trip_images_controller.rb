class TripImagesController < ApplicationController

  def index
    trip = Trip.find_by(uuid: params[:trip_uuid])
    trip_images = trip.trip_images

    render json: trip_images
  end

  def create
    trip = Trip.find_by(uuid: params[:trip_uuid])
    trip_image = trip.trip_images.create!(user_id: current_user["id"], image: params[:trip_image][:image], caption: params[:trip_image][:caption])
    
    render json: trip_image
  end
end
