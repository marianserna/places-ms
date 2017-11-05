class LoadPlaces
  attr_accessor :lat, :lon, :client

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
    @client = GooglePlaces::Client.new(ENV.fetch("GOOGLE_PLACES_API_KEY"))
  end

  def load
    @client.spots(lat, lon, detail: true, exclude: ['locality', 'political'])
  end
end
