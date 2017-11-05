class SavePlaces
  attr_accessor :google_places

  def initialize(google_places)
    @google_places = google_places
  end

  def save
    self.google_places.each do |gplace|
      save_gplace(gplace)
    end
  end

  private

  def save_gplace(gplace)
    city = find_or_create_city(gplace)

    place = city.places.near([gplace.lat, gplace.lng]).where(name: gplace.name).first

    return if place.present?

    place = city.places.create(
      name: gplace.name,
      lat: gplace.lat,
      lon: gplace.lng,
      address: gplace.formatted_address,
      google_id: gplace.place_id,
      category: gplace.types[0]
    )

    place

  end

  def find_or_create_city(gplace)
    city = City.near([gplace.lat, gplace.lng]).where(name: gplace.city).first

    return city if city.present?

    city = City.create(
      name: gplace.city,
      country: gplace.country,
      lat: gplace.lat,
      lon: gplace.lng
    )

    city
  end
end
