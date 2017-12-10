class TripImageSerializer < ActiveModel::Serializer
  attributes :id, :card_image, :detail_image, :caption, :user_name

  belongs_to :trip

  def card_image
    # access place image that's being serialized using 'object'. See carrierwave docs
    url = object.image.card.url
    local_img_url(url)
  end

  def detail_image
    url = object.image.detail.url
    local_img_url(url)
  end

  private

  def local_img_url(url)
    if url.start_with?('http')
      url
    else
      "http://localhost:5000/#{url}"      
    end
  end
end
