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

ActiveRecord::Schema.define(version: 2018_10_09_111312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "duration"
    t.integer "timeleft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "joinCode"
    t.datetime "startTime"
    t.boolean "active"
    t.integer "duration"
    t.string "center"
    t.string "centerRadius"
    t.integer "currentRadius"
    t.integer "startRadius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.boolean "isHost"
    t.string "location"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
