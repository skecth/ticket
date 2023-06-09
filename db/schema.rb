# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_02_070551) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.date "end_date"
    t.string "poster"
    t.string "category"
    t.string "subcategory"
    t.string "location"
    t.bigint "organizer_id", null: false
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
  end

  create_table "order_tickets", force: :cascade do |t|
    t.integer "quantity"
    t.integer "ticket_id"
    t.integer "order_id"
    t.decimal "total"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_profiles", force: :cascade do |t|
    t.string "org_name"
    t.string "org_about"
    t.string "fb"
    t.string "reg_number"
    t.text "address"
    t.string "comp_email"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organizer_id", null: false
    t.index ["organizer_id"], name: "index_org_profiles_on_organizer_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "about_org"
    t.string "organization"
    t.string "fb"
    t.string "company_profile"
    t.string "company_reg"
    t.string "company_address"
    t.string "company_email"
    t.string "company_number"
    t.string "profile_picture"
    t.index ["email"], name: "index_organizers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  add_foreign_key "events", "organizers"
  add_foreign_key "org_profiles", "organizers"
  add_foreign_key "tickets", "events"
end
