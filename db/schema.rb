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

ActiveRecord::Schema.define(version: 2023_01_06_194619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "cars", force: :cascade do |t|
    t.boolean "gas", default: false
    t.boolean "maintenance", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.boolean "trim_trees", default: false
    t.boolean "clear_yard", default: false
    t.boolean "shutters", default: false
    t.boolean "fill_bathtub", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "kids", force: :cascade do |t|
    t.boolean "medicine", default: false
    t.boolean "toys", default: false
    t.boolean "clothing", default: false
    t.boolean "medical_records", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kids_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.boolean "medicine", default: false
    t.boolean "food", default: false
    t.boolean "food_water_bowls", default: false
    t.boolean "crate", default: false
    t.boolean "toys", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.boolean "review_insurance_docs", default: false
    t.boolean "check_evac_zone", default: false
    t.boolean "evac_plan", default: false
    t.boolean "check_evac_route", default: false
    t.boolean "three_days_water", default: false
    t.boolean "three_days_food", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "prep_kits", force: :cascade do |t|
    t.boolean "batteries", default: false
    t.boolean "first_aid_kit", default: false
    t.boolean "toiletries", default: false
    t.boolean "cash", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prep_kits_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.boolean "medical", default: false
    t.boolean "gov_id", default: false
    t.boolean "birth_cert", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "plan_table", default: true
    t.boolean "prep_kit_table", default: true
    t.boolean "records_table", default: true
    t.boolean "car_table", default: false
    t.boolean "house_table", default: false
    t.boolean "kids_table", default: false
    t.boolean "pets_table", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "users"
  add_foreign_key "houses", "users"
  add_foreign_key "kids", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "prep_kits", "users"
  add_foreign_key "records", "users"
end
