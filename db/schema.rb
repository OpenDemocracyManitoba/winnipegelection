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

ActiveRecord::Schema.define(:version => 20100711190634) do

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
    t.datetime "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
  end

end
