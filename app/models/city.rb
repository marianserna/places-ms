class City < ApplicationRecord
  has_many :places

  validates :name, :country, :province, :lat, :lon, presence: true
end
