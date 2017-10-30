class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :province, :lat, :lon

  has_many :places
end
