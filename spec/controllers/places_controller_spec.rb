require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe 'index' do
    it 'returns places as json' do
      create(:place)
      
      get :index
      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to eq(1)
    end
  end
end
