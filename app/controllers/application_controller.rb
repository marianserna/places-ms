class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token


  def current_user
    # Get the token from here (frontend-ms): Authorization: `Bearer ${user_token}`
    # token = request.env["Authorization"].split(' ').last
    authenticate_or_request_with_http_token do |token, options|
      user = Authenticator.getUser(token)
      user.merge({"token" => token})
    end
  end
end
