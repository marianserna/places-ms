class InvitationsController < ApplicationController

  def create
    trip = Trip.find_by(uuid: params[:trip_uuid])
    email = params[:email]

    InvitationMailer.buddy_invite(email, current_user, trip).deliver_now

    # 204 response
    head :no_content
  end
end
