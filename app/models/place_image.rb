class PlaceImage < ApplicationRecord
  belongs_to :place

  validates :image, presence: true
end
