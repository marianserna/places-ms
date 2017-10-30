require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it 'only allows ratings between 1 and 5' do
      review = build(:review)
      expect(review.valid?).to eq(true)
    end

    it 'only allows ratings between 1 and 5' do
      review = build(:review)
      review.rating = 10
      expect(review.invalid?).to eq(true)
    end
  end
end
