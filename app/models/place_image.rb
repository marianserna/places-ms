class PlaceImage < ApplicationRecord
  mount_uploader :image, PlaceImageUploader

  belongs_to :place

  validates :image, presence: true
end
