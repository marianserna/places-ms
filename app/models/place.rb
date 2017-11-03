class Place < ApplicationRecord
  ACTIVITY_TYPES = ['adventure', 'traditional']
  reverse_geocoded_by :lat, :lon

  belongs_to :city
  has_many :place_images

  validates :name, :activity_type, :lat, :lon, :address, :postal_code, :google_id, :category, presence: true
  validates :activity_type, inclusion: { in: ACTIVITY_TYPES }

  scope :by_activity_type, ->(activity_type) {
    where(activity_type: activity_type)
  }

  scope :by_category, ->(category) {
    where(category: category)
  }
end
