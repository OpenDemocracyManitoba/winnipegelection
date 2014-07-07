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

ActiveRecord::Schema.define(version: 20140707173239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "candidacies", force: true do |t|
    t.text     "questionnaire"
    t.date     "end_date"
    t.boolean  "is_incumbent"
    t.boolean  "is_winner"
    t.integer  "person_id"
    t.integer  "electoral_race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidacies", ["electoral_race_id"], name: "index_candidacies_on_electoral_race_id", using: :btree
  add_index "candidacies", ["person_id", "electoral_race_id"], name: "index_candidacies_on_person_id_and_electoral_race_id", unique: true, using: :btree
  add_index "candidacies", ["person_id"], name: "index_candidacies_on_person_id", using: :btree

  create_table "elections", force: true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "is_by_election"
    t.date     "writ_date"
    t.date     "election_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electoral_races", force: true do |t|
    t.integer  "region_id"
    t.integer  "election_id"
    t.text     "polygon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seats_to_fill"
  end

  add_index "electoral_races", ["election_id"], name: "index_electoral_races_on_election_id", using: :btree
  add_index "electoral_races", ["region_id", "election_id"], name: "index_electoral_races_on_region_id_and_election_id", unique: true, using: :btree
  add_index "electoral_races", ["region_id"], name: "index_electoral_races_on_region_id", using: :btree

  create_table "news_articles", force: true do |t|
    t.string   "title"
    t.datetime "publication_date"
    t.string   "google_news_url"
    t.string   "url"
    t.string   "moderation"
    t.text     "rejection_reason"
    t.integer  "news_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_articles", ["news_source_id"], name: "index_news_articles_on_news_source_id", using: :btree

  create_table "news_mentions", force: true do |t|
    t.text     "summary"
    t.integer  "person_id"
    t.integer  "news_article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_mentions", ["news_article_id"], name: "index_news_mentions_on_news_article_id", using: :btree
  add_index "news_mentions", ["person_id", "news_article_id"], name: "index_news_mentions_on_person_id_and_news_article_id", unique: true, using: :btree
  add_index "news_mentions", ["person_id"], name: "index_news_mentions_on_person_id", using: :btree

  create_table "news_sources", force: true do |t|
    t.string   "name"
    t.string   "base_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "permalink"
    t.boolean  "show_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "office_address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "image"
    t.string   "website"
    t.string   "council_site"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "region_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "region_type_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seats"
  end

  add_index "regions", ["region_id"], name: "index_regions_on_region_id", using: :btree
  add_index "regions", ["region_type_id"], name: "index_regions_on_region_type_id", using: :btree

end
