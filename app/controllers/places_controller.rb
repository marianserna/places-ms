class PlacesController < ApplicationController
  def index
    places = Place.near([params[:lat], params[:lon]], 5, units: :km)
    places = places.by_activity_type(params[:activity_type]) if params[:activity_type]
    places = places.by_category(params[:category]) if params[:category]

    if !places.exists?
      begin
        Place.load_and_save(params[:lat], params[:lon])
      rescue GooglePlaces::OverQueryLimitError
      end
    end

    render json: places
  end
end
