class Buddy < ApplicationRecord
  belongs_to :trip

  validates :user_id, :email, :uid, presence: true
end
