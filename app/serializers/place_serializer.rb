class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :activity_type, :lat, :lon, :address, :category

  belongs_to :city
end
