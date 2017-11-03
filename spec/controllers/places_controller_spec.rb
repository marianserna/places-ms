require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe 'index' do
    it 'doesnt find place by lat and lon' do
      create(:place)

      get :index, params: {
        lat: '6.244203',
        lon: '-75.581212'
      }

      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to eq(0)
    end

    it 'finds place by lat and lon' do
      create(:place)

      get :index, params: {
        lat: '43.653226',
        lon: '-79.383184'
      }

      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to eq(1)
    end

    it 'finds places by activity_type' do
      place = create(:place)

      get :index, params: {
        lat: '43.653226',
        lon: '-79.383184',
        activity_type: 'traditional'
      }

      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first).to eq({
        "activity_type" => "traditional",
        "address" => "93 Front St E",
        "category" => "food",
        "city" => {
          "id"=>place.city_id,
          "name"=>"Toronto",
          "country"=>"CA",
          "province"=>"ON",
          "lat"=>"43.65323",
          "lon"=>"-79.38318"
        },
        "id" => place.id,
        "lat" => "43.64266",
        "lon" => "-79.36966",
        "name" => "St. Lawrence Market",
        "postal_code" => "M5E 1C3",
      })
    end

    it 'finds places by category' do
      place = create(:place)

      get :index, params: {
        lat: '43.653226',
        lon: '-79.383184',
        category: 'food'
      }

      expect(response.status).to eq(200)

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first).to eq({
        "activity_type" => "traditional",
        "address" => "93 Front St E",
        "category" => "food",
        "city" => {
          "id"=>place.city_id,
          "name"=>"Toronto",
          "country"=>"CA",
          "province"=>"ON",
          "lat"=>"43.65323",
          "lon"=>"-79.38318"
        },
        "id" => place.id,
        "lat" => "43.64266",
        "lon" => "-79.36966",
        "name" => "St. Lawrence Market",
        "postal_code" => "M5E 1C3",
      })
    end
  end


end