class PlacesController < ApplicationController
  def index
    places = Place.near([params[:lat], params[:lon]], 20, units: :km)
    places = places.by_category(params[:type]) if params[:type].present?

    unless Rails.env.test?
      begin
        place = PlaceSearch.new
        place.async.load_and_save(params[:lat], params[:lon], params[:type], current_user["token"])
      rescue GooglePlaces::OverQueryLimitError
      end
    end

    render json: places
  end
end
