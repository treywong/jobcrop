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

ActiveRecord::Schema.define(version: 2018_10_17_065231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "jobhunter_id"
    t.string "session"
    t.string "files"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_bookings_on_job_id"
    t.index ["jobhunter_id"], name: "index_bookings_on_jobhunter_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "employer_id"
    t.string "name"
    t.string "website"
    t.string "telephone"
    t.string "background"
    t.string "location"
    t.string "size"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jobs_count"
    t.integer "jobhunters_count", default: 0
    t.index ["employer_id"], name: "index_companies_on_employer_id"
  end

  create_table "company_timelines", force: :cascade do |t|
    t.bigint "company_id"
    t.string "title"
    t.string "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_timelines_on_company_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "institute"
    t.string "qualification"
    t.string "location"
    t.string "major"
    t.string "description"
    t.date "graduation_year"
    t.integer "currently_studying"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "employers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jobhunters_count", default: 0
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "company"
    t.string "location"
    t.integer "salary"
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.integer "currently_working"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "jobhunter_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_follows_on_company_id"
    t.index ["jobhunter_id"], name: "index_follows_on_jobhunter_id"
  end

  create_table "freelances", force: :cascade do |t|
    t.bigint "employer_id"
    t.string "description"
    t.integer "payment"
    t.string "location"
    t.string "photos"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_freelances_on_employer_id"
  end

  create_table "jobhunters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "preferences"
    t.string "title_expectation"
    t.string "salary_expectation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position_expectation"
    t.index ["user_id"], name: "index_jobhunters_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "company_id"
    t.string "title"
    t.integer "salary"
    t.string "details"
    t.string "location"
    t.string "photos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "dialect"
    t.integer "native"
    t.integer "writing"
    t.integer "speaking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "employer_id"
    t.bigint "jobhunter_id"
    t.string "title"
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_reviews_on_employer_id"
    t.index ["jobhunter_id"], name: "index_reviews_on_jobhunter_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "email"
    t.string "phone"
    t.string "avatar"
    t.string "password"
    t.string "about_me"
    t.string "address"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.string "gender"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
end
