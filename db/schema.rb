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

ActiveRecord::Schema.define(version: 20180222163950) do

  create_table "date_statuses", force: :cascade do |t|
    t.string "date"
    t.string "day"
    t.string "night"
    t.integer "karaoke_shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freetime_data", force: :cascade do |t|
    t.datetime "weekday_dayfree1_starttime"
    t.datetime "weekday_dayfree1_endtime"
    t.integer "weekday_dayfree1_limittime"
    t.datetime "weekday_dayfree2_starttime"
    t.datetime "weekday_dayfree2_endtime"
    t.integer "weekday_dayfree2_limittime"
    t.datetime "weekday_nightfree1_starttime"
    t.datetime "weekday_nightfree1_endtime"
    t.integer "weekday_nightfree1_limittime"
    t.datetime "weekday_nightfree2_starttime"
    t.datetime "weekday_nightfree2_endtime"
    t.integer "weekday_nightfree2_limittime"
    t.datetime "holiday_dayfree1_starttime"
    t.datetime "holiday_dayfree1_endtime"
    t.integer "holiday_dayfree1_limittime"
    t.datetime "holiday_dayfree2_starttime"
    t.datetime "holiday_dayfree2_endtime"
    t.integer "holiday_dayfree2_limittime"
    t.datetime "holiday_nightfree1_starttime"
    t.datetime "holiday_nightfree1_endtime"
    t.integer "holiday_nightfree1_limittime"
    t.datetime "holiday_nightfree2_starttime"
    t.datetime "holiday_nightfree2_endtime"
    t.integer "holiday_nightfree2_limittime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "karaoke_shop_id"
  end

  create_table "karaoke_kinds", force: :cascade do |t|
    t.string "name"
    t.string "name_of_model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "karaoke_shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "karaoke_kind_id"
  end

  create_table "member_price_data", force: :cascade do |t|
    t.integer "weekday_day_price"
    t.integer "holiday_day_price"
    t.integer "weekday_night_price"
    t.integer "holiday_night_price"
    t.integer "weekday_dayfree1_price"
    t.integer "holiday_dayfree1_price"
    t.integer "weekday_nightfree1_price"
    t.integer "holiday_nightfree1_price"
    t.integer "weekday_dayfree2_price"
    t.integer "holiday_dayfree2_price"
    t.integer "weekday_nightfree2_price"
    t.integer "holiday_nightfree2_price"
    t.integer "karaoke_shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoptime_data", force: :cascade do |t|
    t.string "date"
    t.datetime "open_time"
    t.datetime "close_time"
    t.string "nightstart_time"
    t.integer "karaoke_shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
