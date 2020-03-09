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


ActiveRecord::Schema.define(version: 2020_03_09_151716) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "feedback_id"
    t.index ["feedback_id"], name: "index_answers_on_feedback_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "tester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "version_id"
    t.index ["tester_id"], name: "index_feedbacks_on_tester_id"
    t.index ["version_id"], name: "index_feedbacks_on_version_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.integer "quantity"
    t.string "checkout_session_id"
    t.bigint "startup_id"
    t.bigint "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startup_id"], name: "index_orders_on_startup_id"
    t.index ["version_id"], name: "index_orders_on_version_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "version_id"
    t.index ["version_id"], name: "index_questions_on_version_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "feedback_id"
    t.index ["feedback_id"], name: "index_reviews_on_feedback_id"
    t.index ["startup_id"], name: "index_reviews_on_startup_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "company_name"
    t.string "url"
    t.string "description"
    t.integer "sector"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "target_education", default: [], array: true
    t.text "target_age", default: [], array: true
    t.text "target_profession", default: [], array: true
    t.text "target_rating", default: [], array: true
    t.text "target_nationality", default: [], array: true
    t.text "target_sex", default: [], array: true
    t.index ["user_id"], name: "index_startups_on_user_id"
  end

  create_table "testers", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "education"
    t.integer "age"
    t.integer "profession"
    t.integer "sex"
    t.integer "nationality"
    t.integer "account_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_testers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "startup_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["startup_id"], name: "index_versions_on_startup_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "feedbacks"
  add_foreign_key "answers", "questions"
  add_foreign_key "feedbacks", "testers"
  add_foreign_key "feedbacks", "versions"
  add_foreign_key "orders", "startups"
  add_foreign_key "orders", "versions"
  add_foreign_key "questions", "versions"
  add_foreign_key "reviews", "startups"
  add_foreign_key "startups", "users"
  add_foreign_key "testers", "users"
  add_foreign_key "versions", "startups"
end
