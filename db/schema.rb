# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171130124402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buddies", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color", default: "#9068BE", null: false
    t.index ["trip_id"], name: "index_buddies_on_trip_id"
    t.index ["user_id", "trip_id"], name: "index_buddies_on_user_id_and_trip_id", unique: true
    t.index ["user_id"], name: "index_buddies_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.decimal "lat", null: false
    t.decimal "lon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "text", null: false
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_messages_on_trip_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "place_images", force: :cascade do |t|
    t.integer "place_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_images_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.string "activity_type", null: false
    t.decimal "lat", null: false
    t.decimal "lon", null: false
    t.integer "city_id", null: false
    t.string "address", null: false
    t.string "google_id", null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_places_on_city_id"
    t.index ["google_id"], name: "index_places_on_google_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "place_id", null: false
    t.string "image"
    t.integer "rating", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stops", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["place_id"], name: "index_stops_on_place_id"
    t.index ["trip_id", "place_id"], name: "index_stops_on_trip_id_and_place_id", unique: true
    t.index ["trip_id"], name: "index_stops_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

end
