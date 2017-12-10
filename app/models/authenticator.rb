class Authenticator

  def self.getUser(token)
    response = HTTParty.get("#{ENV.fetch('AUTH_URL')}/user", headers: {'Authorization' => "Bearer #{token}"})
    user = JSON.parse(response.body)
  end

end