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

ActiveRecord::Schema.define(version: 2020_01_03_185305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_requests", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "bill_id"
    t.datetime "approved_at"
    t.integer "approved_status"
    t.string "message"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "users_id"
    t.integer "bill_type"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "close_at"
    t.datetime "replenishment_at"
    t.decimal "regular_replenishment_amount"
    t.date "expired_bill_at"
    t.integer "early_close_status"
    t.decimal "amount_limit", precision: 10, scale: 2
    t.string "card_number"
    t.index ["card_number"], name: "index_bills_on_card_number", unique: true
    t.index ["users_id"], name: "index_bills_on_users_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "short_code"
    t.string "phone_code"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_notifications", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "bill_id"
    t.string "message"
    t.integer "status", default: 1
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.string "second_name"
    t.integer "role", default: 2
    t.date "birthday"
    t.integer "gender"
    t.string "status", default: "disable"
    t.integer "phone"
    t.bigint "cities_id"
    t.index ["cities_id"], name: "index_users_on_cities_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bills", "users", column: "users_id"
  add_foreign_key "cities", "countries"
end
