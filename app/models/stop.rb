class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :place
  has_many :trip_images

  def user_name
    NameLookup.name(self.user_id)
  end
end
