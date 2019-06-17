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

ActiveRecord::Schema.define(version: 2019_06_17_202059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "api_id"
    t.string "name"
    t.integer "quantity"
    t.string "colors"
    t.string "colorIdentity"
    t.string "type"
    t.string "supertypes"
    t.string "types"
    t.string "subtypes"
    t.string "manaCost"
    t.integer "cmc"
    t.string "rarity"
    t.string "set"
    t.string "loyalty"
    t.integer "power"
    t.integer "toughness"
    t.text "text"
    t.string "imageUrl"
    t.text "flavor"
    t.string "gameFormat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "user_id"
    t.string "name"
    t.integer "card_count"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
