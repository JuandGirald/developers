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

ActiveRecord::Schema.define(version: 20150102222606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "age"
    t.string   "location"
    t.integer  "accept_rate"
    t.string   "website_url"
    t.string   "link"
    t.integer  "reputation"
    t.integer  "reputation_change_year"
    t.integer  "reputation_change_quarter"
    t.integer  "reputation_change_month"
    t.integer  "reputation_change_week"
    t.integer  "bronze_badges"
    t.integer  "silver_badges"
    t.integer  "gold_badges"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

end
