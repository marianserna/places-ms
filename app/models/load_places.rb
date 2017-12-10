class LoadPlaces
  attr_accessor :lat, :lon, :type, :client

  def initialize(lat, lon, type)
    @lat = lat
    @lon = lon
    @type = type
    @client = GooglePlaces::Client.new(ENV.fetch("GOOGLE_PLACES_API_KEY"))
  end

  def load
    options = {detail: true, exclude: ['locality', 'political']}
    options.merge!(types: [@type]) if @type.present?

    @client.spots(lat, lon, options)
  end
end
