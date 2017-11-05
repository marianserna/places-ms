class PlaceImageSerializer < ActiveModel::Serializer
  attributes :id, :card_image, :detail_image

  belongs_to :place

  def card_image
    # access place image that's being serialized using 'object'. See carrierwave docs
    object.image.card.url
  end

  def detail_image
    object.image.detail.url
  end
end
