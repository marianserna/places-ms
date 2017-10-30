class Message < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :text, presence:true
end
