# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110531035143) do

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.integer  "ward_id"
    t.integer  "incumbent_since"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "office_address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "majorissues"
    t.string   "council_site"
    t.text     "other_resources"
    t.text     "qa"
  end

  create_table "mentions", :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "news_article_id"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_articles", :force => true do |t|
    t.string   "title"
    t.string   "source"
    t.datetime "pubdate"
    t.text     "gnews_url"
    t.string   "url"
    t.string   "moderation", :default => "new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "rejection"
  end

  add_index "news_articles", ["url"], :name => "index_news_articles_on_url"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_divisions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_wards", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "school_division_id"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trustee_candidates", :force => true do |t|
    t.string   "name"
    t.integer  "school_ward_id"
    t.boolean  "incumbent"
    t.integer  "incumbent_since"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "phone_number"
    t.string   "email"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "qa"
  end

  create_table "wards", :force => true do |t|
    t.string   "name"
    t.string   "pdf_map_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "ward_type"
    t.text     "stats"
    t.text     "past_votes"
  end

end
