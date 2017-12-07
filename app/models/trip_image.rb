class TripImage < ApplicationRecord
  mount_uploader :image, PlaceImageUploader

  belongs_to :trip
  belongs_to :place

  validates :image, presence: true
end
