class TripImage < ApplicationRecord
  mount_uploader :image, TripImageUploader

  belongs_to :trip

  validates :image, presence: true

  def user_name
    NameLookup.name(self.user_id)
  end
end
