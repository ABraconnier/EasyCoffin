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

ActiveRecord::Schema.define(version: 2019_11_04_195457) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "profile_picture"
    t.integer "account_number"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "mourners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "account_number"
    t.integer "rating"
    t.integer "age"
    t.integer "years_of_expertise"
    t.integer "mourning_intensity"
    t.integer "price_range"
    t.string "profile_picture"
    t.index ["email"], name: "index_mourners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mourners_on_reset_password_token", unique: true
  end

  create_table "prestations", force: :cascade do |t|
    t.text "review"
    t.string "location"
    t.date "date"
    t.integer "price"
    t.bigint "mourner_id"
    t.integer "status"
    t.integer "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mourner_id"], name: "index_prestations_on_mourner_id"
  end
  add_foreign_key "prestations", "mourners"
end
