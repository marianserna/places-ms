class Trip < ApplicationRecord
  has_many :stops
  has_many :buddies

  validates :name, :user_id, presence: true
end
