require 'rails_helper'

RSpec.describe SavePlaces do
  describe 'save', :vcr do
    it 'saves places from google' do
      loader = LoadPlaces.new(45.837159, -78.379124)
      google_places = loader.load

      saver = SavePlaces.new([google_places[0]])
      saver.save
      first_place = Place.first

      expect(City.count).to eq(1)
      expect(City.first.name).to eq("Rural Area")
      expect(Place.count).to eq(1)
      expect(first_place.name).to eq('Algonquin Provincial Park')
      expect(first_place.place_images.count).to eq(2)
    end
  end
end
