class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :lat, :lon

  has_many :places
end
