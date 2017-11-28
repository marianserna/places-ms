class PlacesController < ApplicationController

  def index
    Place.load_and_save(params[:lat], params[:lon])
    
    places = Place.near([params[:lat], params[:lon]])
    places = places.by_activity_type(params[:activity_type]) if params[:activity_type]
    places = places.by_category(params[:category]) if params[:category]

    render json: places
  end
end
