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

ActiveRecord::Schema.define(:version => 20111214222520) do

  create_table "bookmarks", :force => true do |t|
    t.string   "URL"
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_saved"
    t.string   "UserMade"
  end

  create_table "user_bookmarks", :force => true do |t|
    t.integer  "bookmark_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "real_name"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  create_table "users_bookmarks", :force => true do |t|
    t.integer  "bookmark_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
