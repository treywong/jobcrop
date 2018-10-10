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

ActiveRecord::Schema.define(version: 2018_10_08_163752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "booked_at"
    t.string "files", array: true
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_bookings_on_job_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "location"
    t.string "website"
    t.integer "telephone"
    t.integer "company_size"
    t.string "industry"
    t.string "overview"
    t.string "join_us"
    t.string "photos", array: true
    t.datetime "session", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "work_location"
    t.string "description"
    t.string "responsibility"
    t.integer "work_hour_start"
    t.integer "work_hour_end"
    t.integer "salary"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "company_id"
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "jobhunter"
    t.string "email"
    t.string "phone"
    t.date "birthday"
    t.string "password"
    t.string "detail"
    t.string "image"
    t.string "checklist", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "bookings", "jobs"
  add_foreign_key "bookings", "users"
  add_foreign_key "jobs", "companies"
  add_foreign_key "users", "companies"
end
