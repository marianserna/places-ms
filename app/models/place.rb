class Place < ApplicationRecord
  ACTIVITY_TYPES = ['adventure', 'traditional']
  reverse_geocoded_by :lat, :lon

  ADVENTURE_CATEGORIES = ['amusement_park', 'bowling_alley', 'campground', 'casino', 'gym', 'nightclub', 'zoo', 'park']

  belongs_to :city
  has_many :place_images

  validates :name, :activity_type, :lat, :lon, :address, :google_id, :category, presence: true
  validates :activity_type, inclusion: { in: ACTIVITY_TYPES }

  scope :by_activity_type, ->(activity_type) {
    where(activity_type: activity_type)
  }

  scope :by_category, ->(category) {
    where(category: category)
  }

  before_validation :set_activity_type, on: :create

  def set_activity_type
    if ADVENTURE_CATEGORIES.include?(self.category)
      self.activity_type = 'adventure'
    else
      self.activity_type = 'traditional'
    end
  end

  def self.load_and_save(lat, lon, type)
    loader = LoadPlaces.new(lat, lon, type)
    result = loader.load

    saver = SavePlaces.new(result)
    saver.save
  end
end
