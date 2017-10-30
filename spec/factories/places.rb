FactoryBot.define do
  factory :place do
    name "St. Lawrence Market"
    activity_type "traditional"
    lat 43.64266
    lon -79.36966
    address "93 Front St E"
    postal_code "M5E 1C3"
    google_id "ABC123"
    category "food"
    city
  end
end
