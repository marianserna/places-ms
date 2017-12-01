class NameLookup
  def self.names(user_id_collection)
    user_ids = user_id_collection.map(&:user_id)

    response = HTTParty.post(
      "#{ENV.fetch('AUTH_URL')}/users/names",
      body: {ids: user_ids}.to_json,
      headers: {'Content-Type' => 'application/json'}
    )
    # data looks like: {"1": "Bob", "2": "Alanis"}
    user_names = JSON.parse(response.body)
  end

  def self.name(user_id)
    response = HTTParty.post(
      "#{ENV.fetch('AUTH_URL')}/users/names", 
      body: {ids: [user_id]}.to_json,
      headers: {'Content-Type' => 'application/json'}
    )

    user_names = JSON.parse(response.body)
    user_names[user_id.to_s]
  end
end
