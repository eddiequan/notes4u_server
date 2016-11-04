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

ActiveRecord::Schema.define(version: 20161104174302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "course_code"
    t.string "semester"
    t.string "professor"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rating"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "req_id"
    t.integer "user_id"
    t.integer "status"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "when"
    t.string   "location"
    t.integer  "user_id"
  end

  create_table "tooks", force: :cascade do |t|
    t.integer "course_id"
    t.decimal "grade"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "username"
    t.string   "auth_token"
    t.string   "password"
    t.string   "major"
  end

end
