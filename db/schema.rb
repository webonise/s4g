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

ActiveRecord::Schema.define(:version => 20130104132631) do

  create_table "business_companies", :force => true do |t|
    t.string   "business_name"
    t.string   "address"
    t.string   "description"
    t.integer  "contact"
    t.integer  "business_user_id"
    t.integer  "causes_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "business_companies", ["business_user_id"], :name => "index_business_companies_on_business_user_id"

  create_table "business_has_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "business_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "business_has_users", ["business_company_id"], :name => "index_business_has_users_on_business_company_id"
  add_index "business_has_users", ["user_id"], :name => "index_business_has_users_on_user_id"

  create_table "business_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "business_users", ["person_id"], :name => "index_business_users_on_person_id"

  create_table "causes", :force => true do |t|
    t.string   "cause_name"
    t.string   "description"
    t.string   "url"
    t.string   "address"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "impressions", :force => true do |t|
    t.float    "fund_raise"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "impressions", ["post_id"], :name => "index_impressions_on_post_id"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "people", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "person_role"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "content"
    t.integer  "business_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "posts", ["business_company_id", "created_at"], :name => "index_posts_on_business_company_id_and_created_at"

  create_table "user_has_causes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "causes_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_has_causes", ["user_id"], :name => "index_user_has_causes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["person_id"], :name => "index_users_on_person_id"

end
