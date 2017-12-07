class Trip < ApplicationRecord
  has_many :stops
  has_many :places, through: :stops
  has_many :buddies
  has_many :messages
  has_many :trip_images

  validates :name, :user_id, presence: true
end
