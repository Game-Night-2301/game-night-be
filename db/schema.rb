# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_11_213745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "title"
    t.boolean "cancelled"
    t.string "description"
    t.bigint "host_id"
    t.bigint "game"
    t.string "game_type"
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.string "end_time"
  end

  create_table "games", force: :cascade do |t|
    t.string "bga_id"
    t.string "name"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.string "description"
    t.string "image_url"
    t.float "average_user_rating"
    t.float "average_strategy_complexity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_user_games_on_game_id"
    t.index ["user_id"], name: "index_user_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "city"
    t.string "state"
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "user_games", "games"
  add_foreign_key "user_games", "users"
end
