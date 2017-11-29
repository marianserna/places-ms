class Buddy < ApplicationRecord
  belongs_to :trip

  validates :user_id, presence: true

  DEFAULT_COLORS = ['#6ED3CF', '#DCAE1D', '#F05945', '#0B90AA', '#B1B336', '#E94C6F', '#542733']

  def user_name
    NameLookup.name(self.user_id)
  end
end
