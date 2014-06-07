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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140607020703) do

  create_table "clearance_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.integer  "version_id"
    t.string   "clearance_reason"
    t.decimal  "price"
    t.string   "year"
    t.integer  "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "product_type"
  end

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "dadmins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.datetime "reset_password_sent_at"
  end

  add_index "dadmins", ["email"], :name => "index_dadmins_on_email", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "version_id"
    t.decimal  "price"
  end

  create_table "images", :force => true do |t|
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "model"
    t.integer  "model_id"
    t.text     "caption"
    t.string   "tag"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "link"
  end

  create_table "paddlers", :force => true do |t|
    t.string   "name"
    t.integer  "image_id"
    t.string   "height"
    t.string   "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_colors", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "color_id"
  end

  create_table "products", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.string   "length"
    t.string   "width"
    t.string   "height"
    t.string   "weight"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "product_type"
    t.integer  "capacity"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.integer  "waterbody_id"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "paddler_kayak"
    t.decimal  "mileage"
    t.string   "launch_location"
    t.string   "takeout_location"
    t.string   "nearest_water_gauge"
    t.string   "runnable_range"
  end

  create_table "version_features", :id => false, :force => true do |t|
    t.integer "version_id"
    t.integer "feature_id"
  end

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "manufacturer_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "product_id"
    t.boolean  "base_version",    :default => false
  end

  create_table "waterbodies", :force => true do |t|
    t.string   "country"
    t.string   "state"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "water_type"
  end

end
