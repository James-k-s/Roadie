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

ActiveRecord::Schema[7.1].define(version: 2025_06_04_213511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.text "pitch"
    t.boolean "accepted"
    t.string "meeting_link"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "vacancy_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
    t.index ["vacancy_id"], name: "index_applications_on_vacancy_id"
  end

  create_table "band_members", force: :cascade do |t|
    t.boolean "band_leader"
    t.bigint "band_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instrument_id", null: false
    t.index ["band_id"], name: "index_band_members_on_band_id"
    t.index ["instrument_id"], name: "index_band_members_on_instrument_id"
    t.index ["user_id"], name: "index_band_members_on_user_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "bio"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_chats_on_band_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "band_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_member_id"], name: "index_events_on_band_member_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "message_content"
    t.bigint "user_id", null: false
    t.bigint "chats_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chats_id"], name: "index_messages_on_chats_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "status"
    t.string "title"
    t.string "type"
    t.string "link"
    t.bigint "band_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_notifications_on_band_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id"
    t.bigint "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_posts_on_band_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "band_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_projects_on_band_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.bigint "band_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_songs_on_band_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address", null: false
    t.text "bio", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "instrument"
    t.text "description"
    t.boolean "filled"
    t.bigint "band_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "years_of_experience", null: false
    t.string "availability", null: false
    t.string "confidence", null: false
    t.index ["band_id"], name: "index_vacancies_on_band_id"
  end

  add_foreign_key "applications", "users"
  add_foreign_key "applications", "vacancies"
  add_foreign_key "band_members", "bands"
  add_foreign_key "band_members", "instruments"
  add_foreign_key "band_members", "users"
  add_foreign_key "bands", "users"
  add_foreign_key "chats", "bands"
  add_foreign_key "chats", "users"
  add_foreign_key "events", "band_members"
  add_foreign_key "genres", "users"
  add_foreign_key "instruments", "users"
  add_foreign_key "messages", "chats", column: "chats_id"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "bands"
  add_foreign_key "notifications", "users"
  add_foreign_key "posts", "bands"
  add_foreign_key "posts", "users"
  add_foreign_key "projects", "bands"
  add_foreign_key "songs", "bands"
  add_foreign_key "songs", "users"
  add_foreign_key "vacancies", "bands"
end
