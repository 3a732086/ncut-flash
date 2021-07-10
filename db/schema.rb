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

ActiveRecord::Schema.define(version: 2021_07_09_222858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_topics", force: :cascade do |t|
    t.integer "course_id"
    t.integer "number"
    t.string "eng_topic"
    t.string "chi_topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ctrs", force: :cascade do |t|
    t.integer "user_id"
    t.string "scenes"
    t.datetime "inserted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "score"
    t.integer "use_time"
    t.string "fail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "scenes"
    t.string "topic"
    t.string "input_data"
    t.datetime "inserted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_infos_on_user_id"
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
    t.string "name"
    t.string "avator"
    t.string "student_class"
    t.integer "role", default: 0, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yellows", force: :cascade do |t|
    t.text "Verb"
    t.text "Noun"
    t.text "Adjective"
    t.text "Adverb"
    t.string "Count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
