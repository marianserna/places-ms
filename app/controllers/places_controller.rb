class PlacesController < ApplicationController
  def index
    places = Place.near([params[:lat], params[:lon]], 20, units: :km)
    places = places.by_category(params[:type]) if params[:type].present?

    if !places.exists?
      begin
        Place.load_and_save(params[:lat], params[:lon], params[:type])
      rescue GooglePlaces::OverQueryLimitError
      end
    end

    render json: places
  end
end
