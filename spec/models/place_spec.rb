require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'validations' do
    it 'only allows predefined activity types' do
      place = build(:place)
      expect(place.valid?).to eq(true)

      place.activity_type = 'boring'
      expect(place.invalid?).to eq(true)
    end
  end
end
