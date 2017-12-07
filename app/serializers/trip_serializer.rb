class TripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :rating, :completed, :completed_at, :uuid

  def completed
    object.completed_at.present?
  end
end
