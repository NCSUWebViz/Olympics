# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111210230609) do

  create_table "countries", :force => true do |t|
    t.string   "long_name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "summer_games_count"
    t.integer  "summer_gold_count"
    t.integer  "summer_silver_count"
    t.integer  "summer_bronze_count"
    t.integer  "summer_sports_count"
    t.integer  "summer_events_count"
    t.integer  "winter_games_count"
    t.integer  "winter_gold_count"
    t.integer  "winter_silver_count"
    t.integer  "winter_bronze_count"
    t.integer  "winter_sports_count"
    t.integer  "winter_events_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "games_count"
    t.integer  "countries_count"
    t.integer  "gold_count"
    t.integer  "silver_count"
    t.integer  "bronze_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id"
  end

  create_table "games", :force => true do |t|
    t.integer  "year"
    t.string   "country"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "summer"
    t.string   "meta_url"
    t.integer  "gold_count"
    t.integer  "silver_count"
    t.integer  "bronze_count"
    t.integer  "countries_count"
    t.integer  "sports_count"
    t.integer  "events_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medals", :force => true do |t|
    t.string   "athlete"
    t.string   "result"
    t.string   "medal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participation_id"
    t.integer  "event_id"
  end

  create_table "old_countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "old_game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gold"
    t.integer  "silver"
    t.integer  "bronze"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "old_games", :force => true do |t|
    t.string    "country"
    t.string    "city"
    t.integer   "year"
    t.string    "season"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "participations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "country_id"
    t.integer  "gold_count"
    t.integer  "silver_count"
    t.integer  "bronze_count"
    t.integer  "sports_count"
    t.integer  "events_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "old_country_id"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.integer  "games_count"
    t.integer  "countries_count"
    t.integer  "gold_count"
    t.integer  "silver_count"
    t.integer  "bronze_count"
    t.integer  "events_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
