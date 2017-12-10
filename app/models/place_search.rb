class PlaceSearch
  include Celluloid::IO

  def load_and_save(lat, lon, type, user_token)
    loader = LoadPlaces.new(lat, lon, type)
    result = loader.load

    saver = SavePlaces.new(result, user_token)
    saver.save
    
    self.terminate
  end
end