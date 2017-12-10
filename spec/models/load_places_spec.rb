require 'rails_helper'

RSpec.describe LoadPlaces do
  describe 'load', :vcr do
    it 'returns places from google' do
      loader = LoadPlaces.new(43.618870, -80.144189, "gym")
      google_places = loader.load

      expect(google_places.present?).to be(true)
      expect(google_places.first).to be_a(GooglePlaces::Spot)
    end
  end

end
