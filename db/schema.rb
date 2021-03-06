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

ActiveRecord::Schema.define(version: 20170628181129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "sub_title"
    t.text "content"
    t.boolean "sticky"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube"
    t.string "pdf"
    t.integer "race_schedule_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "picture"
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "event_teams", force: :cascade do |t|
    t.bigint "race_schedule_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "race_result"
    t.index ["race_schedule_id"], name: "index_event_teams_on_race_schedule_id"
    t.index ["team_id"], name: "index_event_teams_on_team_id"
  end

  create_table "news_feeds", force: :cascade do |t|
    t.integer "race_schedule_id"
    t.bigint "user_id"
    t.integer "team_id"
    t.datetime "date_of_post"
    t.string "picture"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_of_post"], name: "index_news_feeds_on_date_of_post"
    t.index ["race_schedule_id"], name: "index_news_feeds_on_race_schedule_id"
    t.index ["team_id"], name: "index_news_feeds_on_team_id"
    t.index ["user_id"], name: "index_news_feeds_on_user_id"
  end

  create_table "race_schedules", force: :cascade do |t|
    t.string "location"
    t.string "details"
    t.string "race_type"
    t.bigint "user_id"
    t.datetime "race_start_date"
    t.datetime "race_end_date"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_race_schedules_on_user_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "picture"
    t.string "title"
    t.string "description"
    t.string "number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rules_on_user_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "picture"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "sponsored_with"
    t.integer "amount"
    t.string "web_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sponsors_on_user_id"
  end

  create_table "team_infos", force: :cascade do |t|
    t.bigint "team_id"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id"
    t.index ["team_id"], name: "index_team_infos_on_team_id"
    t.index ["topic_id"], name: "index_team_infos_on_topic_id"
    t.index ["user_id"], name: "index_team_infos_on_user_id"
  end

  create_table "team_pictures", force: :cascade do |t|
    t.string "picture"
    t.bigint "user_id"
    t.bigint "team_id"
    t.integer "event_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_team_pictures_on_event_id"
    t.index ["team_id"], name: "index_team_pictures_on_team_id"
    t.index ["user_id"], name: "index_team_pictures_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "driver"
    t.string "home_town"
    t.string "crew_chief"
    t.string "crew"
    t.string "car_name"
    t.string "car"
    t.string "engine"
    t.string "chassis"
    t.string "picture"
    t.string "facebook"
    t.string "youtube"
    t.string "instagram"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_points"
    t.index ["team_name"], name: "index_teams_on_team_name"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "event_teams", "race_schedules"
  add_foreign_key "event_teams", "teams"
  add_foreign_key "news_feeds", "users"
  add_foreign_key "sponsors", "users"
  add_foreign_key "team_infos", "teams"
  add_foreign_key "team_infos", "topics"
  add_foreign_key "team_infos", "users"
  add_foreign_key "team_pictures", "teams"
  add_foreign_key "team_pictures", "users"
end
