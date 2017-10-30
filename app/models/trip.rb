class Trip < ApplicationRecord
  has_many :stops

  validates :name, :user_id, presence: true
end
