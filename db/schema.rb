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

ActiveRecord::Schema.define(:version => 20130210025436) do

  create_table "posts", :force => true do |t|
    t.integer  "comments_count"
    t.integer  "likes_count"
    t.text     "message"
    t.text     "picture_url"
    t.datetime "created_time"
    t.text     "name"
    t.text     "link_url"
    t.text     "caption"
    t.text     "source"
    t.string   "post_type"
    t.string   "fb_post_id"
    t.text     "description"
    t.integer  "facebook_infos_id"
    t.datetime "fb_updated_time"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
