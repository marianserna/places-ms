require 'rails_helper'

RSpec.describe SavePlaces do
  describe 'save', :vcr do
    it 'saves places from google' do
      loader = LoadPlaces.new(43.618870, -80.144189)
      google_places = loader.load

      saver = SavePlaces.new([google_places[0]])
      saver.save
      first_place = Place.first

      expect(City.count).to eq(1)
      expect(City.first.name).to eq("Rockwood")
      expect(Place.count).to eq(1)
      expect(first_place.name).to eq('Rockwood')
    end
  end
end
