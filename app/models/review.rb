class Review < ApplicationRecord
  belongs_to :place

  validates :user_id, :image, :rating, :text, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
end
