class City < ApplicationRecord
  has_many :places
  reverse_geocoded_by :lat, :lon

  validates :name, :country, :lat, :lon, presence: true
end
