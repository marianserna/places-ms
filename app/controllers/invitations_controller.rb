class InvitationsController < ApplicationController

  def create
    trip = Trip.where(user_id: current_user["id"]).find(params[:trip_id])
    email = params[:email]

    InvitationMailer.buddy_invite(email, current_user, trip).deliver_now

    # 204 response
    head :no_content
  end
end
