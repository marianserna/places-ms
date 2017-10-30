class Buddy < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :email, :uid, presence: true
end
