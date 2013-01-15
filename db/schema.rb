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

ActiveRecord::Schema.define(:version => 20130115144827) do

  create_table "business_companies", :force => true do |t|
    t.string   "business_name"
    t.string   "address"
    t.string   "description"
    t.integer  "contact"
    t.integer  "business_user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "cause_id"
    t.string   "logo"
    t.string   "city"
    t.string   "country"
    t.string   "business_logo"
  end

  create_table "business_has_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "business_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "business_users", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "designation"
  end

  create_table "causes", :force => true do |t|
    t.string   "cause_name"
    t.string   "description"
    t.string   "url"
    t.string   "address"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "logo"
  end

  create_table "impressions", :force => true do |t|
    t.float    "fund_raise"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
    t.string   "fb_token"
    t.string   "designation"
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["reset_password_token"], :name => "index_people_on_reset_password_token", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "content"
    t.integer  "business_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "post_type"
  end

  add_index "posts", ["business_company_id", "created_at"], :name => "index_posts_on_business_company_id_and_created_at"

  create_table "user_has_causes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cause_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "fb_token"
  end

end
