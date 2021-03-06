require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'validations' do
    it 'only allows predefined activity types' do
      place = create(:place)
      expect(place.valid?).to eq(true)

      place.activity_type = 'boring'
      expect(place.invalid?).to eq(true)
    end
  end

  describe 'scopes' do
    it 'finds places by activity_type' do
      place = create(:place)
      expect(Place.by_activity_type('adventure').count).to eq(0)

      expect(Place.by_activity_type('traditional').count).to eq(1)
    end

    it 'finds places by category' do
      place = create(:place)
      expect(Place.by_category('food').count).to eq(1)

      expect(Place.by_category('culture').count).to eq(0)
    end
  end

  describe 'finding nearby places' do
    it 'finds places by lat and lon' do
      place = create(:place)
      # Testing Toronto (factory)
      expect(Place.near([43.653226, -79.383184]).count(:all)).to eq(1)

      # Testing Medellin
      expect(Place.near([6.244203, -75.581212]).count(:all)).to eq(0)
    end
  end
end
