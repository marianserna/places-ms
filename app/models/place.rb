class Place < ApplicationRecord
  ACTIVITY_TYPES = ['adventure', 'traditional']

  belongs_to :city
  has_many :place_images

  validates :name, :activity_type, :lat, :lon, :address, :postal_code, :google_id, :category, presence: true
  validates :activity_type, inclusion: { in: ACTIVITY_TYPES }
end
