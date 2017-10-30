class Message < ApplicationRecord
  belongs_to :trip

  validates :user_id, :text, presence:true
end
