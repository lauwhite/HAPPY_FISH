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

ActiveRecord::Schema.define(version: 2019_08_21_045653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "status"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "challenge_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "challenge_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.integer "min_score"
    t.string "duration"
    t.bigint "challenge_category_id"
    t.string "description"
    t.integer "score_health"
    t.float "score_happiness"
    t.bigint "challenge_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "repeatable"
    t.index ["challenge_category_id"], name: "index_challenges_on_challenge_category_id"
    t.index ["challenge_type_id"], name: "index_challenges_on_challenge_type_id"
  end

  create_table "criteria_by_countries", force: :cascade do |t|
    t.bigint "fish_id"
    t.bigint "regional_criteria_id"
    t.string "country"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_criteria_by_countries_on_fish_id"
    t.index ["regional_criteria_id"], name: "index_criteria_by_countries_on_regional_criteria_id"
  end

  create_table "criteria_by_years", force: :cascade do |t|
    t.bigint "fish_id"
    t.integer "year"
    t.bigint "endangered_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endangered_status_id"], name: "index_criteria_by_years_on_endangered_status_id"
    t.index ["fish_id"], name: "index_criteria_by_years_on_fish_id"
  end

  create_table "endangered_statuses", force: :cascade do |t|
    t.string "abbreviation"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fish", force: :cascade do |t|
    t.string "breed"
    t.string "location"
    t.string "fish_avatar"
    t.integer "min_score"
    t.integer "max_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "red_list_id"
    t.bigint "endangered_status_id"
    t.index ["endangered_status_id"], name: "index_fish_on_endangered_status_id"
  end

  create_table "fish_threats", force: :cascade do |t|
    t.bigint "fish_id"
    t.bigint "threat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_fish_threats_on_fish_id"
    t.index ["threat_id"], name: "index_fish_threats_on_threat_id"
  end

  create_table "game_challenges", force: :cascade do |t|
    t.bigint "my_fish_id"
    t.bigint "challenge_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["challenge_id"], name: "index_game_challenges_on_challenge_id"
    t.index ["my_fish_id"], name: "index_game_challenges_on_my_fish_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.integer "min_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_fishes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "fish_id"
    t.string "name"
    t.datetime "start_date"
    t.integer "score_health"
    t.float "score_happiness"
    t.boolean "alive"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_my_fishes_on_fish_id"
    t.index ["user_id"], name: "index_my_fishes_on_user_id"
  end

  create_table "onboarding_answers", force: :cascade do |t|
    t.string "answer"
    t.integer "score"
    t.bigint "onboarding_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_question_id"], name: "index_onboarding_answers_on_onboarding_question_id"
  end

  create_table "onboarding_questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_questions_on_challenge_id"
  end

  create_table "regional_criteria", force: :cascade do |t|
    t.string "distribution_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "threats", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "timing"
    t.string "scope"
    t.string "severity"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "avatar"
    t.bigint "level_id"
    t.boolean "admin"
    t.integer "score"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["level_id"], name: "index_users_on_level_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "challenges", "challenge_categories"
  add_foreign_key "challenges", "challenge_types"
  add_foreign_key "criteria_by_countries", "fish"
  add_foreign_key "criteria_by_countries", "regional_criteria", column: "regional_criteria_id"
  add_foreign_key "criteria_by_years", "endangered_statuses"
  add_foreign_key "criteria_by_years", "fish"
  add_foreign_key "fish", "endangered_statuses"
  add_foreign_key "fish_threats", "fish"
  add_foreign_key "fish_threats", "threats"
  add_foreign_key "game_challenges", "challenges"
  add_foreign_key "game_challenges", "my_fishes"
  add_foreign_key "my_fishes", "fish"
  add_foreign_key "my_fishes", "users"
  add_foreign_key "onboarding_answers", "onboarding_questions"
  add_foreign_key "questions", "challenges"
  add_foreign_key "users", "levels"
end
