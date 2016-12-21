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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161221073910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "property_name"
    t.integer  "stars"
    t.string   "address"
    t.integer  "room_number"
    t.integer  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "total_price"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reservations", ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "password"
    t.string   "gender"
    t.string   "identity"
    t.integer  "phone_number"
    t.string   "currency"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
