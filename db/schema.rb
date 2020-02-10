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

ActiveRecord::Schema.define(version: 2020_02_10_225916) do

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sneaker_id"
    t.integer "total_value"
  end

  create_table "sneakers", force: :cascade do |t|
    t.string "manufacturer"
    t.string "size_us"
    t.string "model"
    t.string "colorway"
    t.integer "est_value"
    t.integer "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "condition"
    t.string "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email_address"
    t.string "password_digest"
    t.integer "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

end
