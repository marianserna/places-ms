class Trip < ApplicationRecord
  has_many :stops
  has_many :places, through: :stops
  has_many :buddies
  has_many :messages

  validates :name, :user_id, presence: true
end
