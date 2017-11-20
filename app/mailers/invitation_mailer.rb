class InvitationMailer < ApplicationMailer

  def buddy_invite(email, user, trip)
    @user = user
    @trip = trip

    mail(to: email, from: user["email"], subject: "Join #{user["name"]} on their #{trip.name} trip planning!")
  end
end
