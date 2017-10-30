class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :activity_type, :lat, :lon, :address, :postal_code, :category

  belongs_to :city
end
