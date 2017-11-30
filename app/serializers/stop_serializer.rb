class StopSerializer < ActiveModel::Serializer
  attributes :id, :place, :user_name, :color

  def user_name
    object.user_name
  end

  def place
    ActiveModelSerializers::SerializableResource.new(
      object.place
    )
  end

  def color
    trip = object.trip
    buddy = trip.buddies.find_by(user_id: object.user_id)
    buddy.color
  end
end
