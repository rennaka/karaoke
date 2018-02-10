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

ActiveRecord::Schema.define(version: 20180210164358) do

  create_table "karaoke_kinds", force: :cascade do |t|
    t.string "name"
    t.string "model_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "karaoke_shops", force: :cascade do |t|
    t.string "name"
    t.integer "day_price"
    t.integer "night_price"
    t.integer "dayfree1_price"
    t.integer "nightfree1_price"
    t.time "open_time"
    t.time "close_time"
    t.time "nightstart_time"
    t.time "dayfree1_start_time"
    t.time "dayfree1_endtime"
    t.time "nightfree1_start_time"
    t.time "nightfree1_endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
