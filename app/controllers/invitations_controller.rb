class InvitationsController < ApplicationController

  def create
    trip = Trip.find(params[:trip_id])
    email = params[:email]

    InvitationMailer.buddy_invite(email, current_user, trip).deliver_now

    # 204 response
    head :no_content
  end
end
