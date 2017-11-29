class Message < ApplicationRecord
  belongs_to :trip

  validates :user_id, :text, presence: true

  def user_name
    NameLookup.name(self.user_id)
  end
end
