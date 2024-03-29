# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151204070457) do

  create_table "contestants", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "age"
    t.string   "gender"
    t.string   "occupation"
    t.text     "description"
    t.boolean  "active",      default: false, null: false
    t.boolean  "published",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contestants_rounds", id: false, force: true do |t|
    t.integer "contestant_id"
    t.integer "round_id"
  end

  add_index "contestants_rounds", ["contestant_id"], name: "index_contestants_rounds_on_contestant_id"
  add_index "contestants_rounds", ["round_id"], name: "index_contestants_rounds_on_round_id"

  create_table "contestants_seasons", id: false, force: true do |t|
    t.integer "contestant_id"
    t.integer "season_id"
    t.string  "status"
    t.boolean "active",        default: true
  end

  add_index "contestants_seasons", ["contestant_id"], name: "index_contestants_seasons_on_contestant_id"
  add_index "contestants_seasons", ["season_id"], name: "index_contestants_seasons_on_season_id"

  create_table "episodes", force: true do |t|
    t.integer  "season_id",                      null: false
    t.datetime "air_date"
    t.integer  "survivor_count"
    t.boolean  "published",      default: false, null: false
    t.boolean  "aired",          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "contestant_id"
    t.integer  "episode_id"
    t.integer  "scheme_id"
    t.text     "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["contestant_id"], name: "index_events_on_contestant_id"
  add_index "events", ["episode_id"], name: "index_events_on_episode_id"
  add_index "events", ["scheme_id"], name: "index_events_on_scheme_id"

  create_table "leagues", force: true do |t|
    t.integer  "creator_id",                        null: false
    t.string   "name"
    t.integer  "season_id"
    t.string   "type"
    t.integer  "participation_cap"
    t.integer  "draft_limit"
    t.datetime "draft_date"
    t.string   "draft_order"
    t.string   "league_key"
    t.string   "league_password"
    t.boolean  "private_access",    default: false, null: false
    t.boolean  "active",            default: false, null: false
    t.boolean  "published",         default: false, null: false
    t.boolean  "full",              default: false, null: false
    t.boolean  "locked",            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.integer  "league_id",                    null: false
    t.integer  "user_id",                      null: false
    t.boolean  "commissioner", default: false
    t.boolean  "favorite",     default: false
    t.integer  "score",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "participant_id",                 null: false
    t.string   "type",                           null: false
    t.integer  "episode_id",                     null: false
    t.integer  "score",          default: 0
    t.boolean  "locked",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schemes", force: true do |t|
    t.integer  "show_id",                     null: false
    t.string   "type",                        null: false
    t.string   "description",                 null: false
    t.integer  "points",      default: 0,     null: false
    t.boolean  "active",      default: false
    t.boolean  "published",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "show_id"
    t.integer  "country_origin"
    t.string   "type"
    t.text     "description"
    t.string   "image"
    t.string   "website"
    t.integer  "network"
    t.datetime "premiere_date"
    t.datetime "finale_date"
    t.integer  "episode_count",  default: 0,     null: false
    t.boolean  "active",         default: false
    t.boolean  "published",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "shows", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "active",     default: false
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lifetime_score",         default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
