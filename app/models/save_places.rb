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

    save_place_images(place, gplace.photos.slice(0, 2))
    place
  end

  def find_or_create_city(gplace)
    city_name = gplace.city || 'Rural Area'

    city = City.near([gplace.lat, gplace.lng]).where(name: city_name).first

    return city if city.present?

    city = City.create!(
      name: city_name,
      country: gplace.country,
      lat: gplace.lat,
      lon: gplace.lng
    )

    city
  end

  # understand place as the instance that's created in the db & gplace as the object coming from google
  def save_place_images(place, gplace_images)
    gplace_images.each do |img|
      place.place_images.create(
        # Save a remote url as an image in your db with carrierwave (go, download the img, then save it)
        remote_image_url: img.fetch_url(1024)
      )
    end
  end
end
