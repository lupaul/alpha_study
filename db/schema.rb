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

ActiveRecord::Schema.define(version: 20170602093823) do

  create_table "activities", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.datetime "datetime"
    t.string   "location"
    t.string   "presenter_name"
    t.text     "presenter_info"
    t.string   "organizer"
    t.integer  "liked",                default: 0
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "participations_count", default: 0
    t.string   "image"
    t.boolean  "is_online"
    t.string   "software"
    t.string   "card_image"
    t.string   "banner_image"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reservation_id"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "datetime"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "school_id"
    t.integer  "license_id"
  end

  create_table "cooperations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.integer "school_id"
    t.integer "license_id"
    t.integer "liked",        default: 0
    t.string  "card_image"
    t.string  "banner_image"
    t.index ["license_id"], name: "index_courses_on_license_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "school"
    t.string   "file_url"
    t.text     "comment"
    t.integer  "cooperation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "state"
  end

  create_table "experts", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "video_url"
    t.text     "article"
    t.integer  "liked",        default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "course_id"
    t.string   "card_image"
    t.string   "banner_image"
    t.string   "avatar_image"
    t.index ["course_id"], name: "index_experts_on_course_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.integer "category_id"
    t.index ["category_id"], name: "index_licenses_on_category_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "slogan"
    t.string   "main_image"
    t.text     "first_description"
    t.text     "second_description"
    t.text     "third_description"
    t.string   "first_image"
    t.string   "second_image"
    t.string   "third_image"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "subject"
    t.string   "location"
    t.boolean  "is_online"
    t.datetime "datetime"
    t.string   "status"
    t.integer  "min_participants", default: 3
    t.integer  "liked",            default: 0
    t.string   "card_image"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "count",            default: 0
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "continent"
    t.string   "address"
    t.string   "email"
    t.string   "image"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "role"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "authentication_token"
    t.string   "provider"
    t.string   "google_uid"
    t.string   "google_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
