class Trip < ApplicationRecord
  before_create :set_uuid

  has_many :stops
  has_many :places, through: :stops
  has_many :buddies
  has_many :messages
  has_many :trip_images

  validates :name, :user_id, presence: true

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
