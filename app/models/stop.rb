class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :place

  def user_name
    NameLookup.name(self.user_id)
  end
end
