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

ActiveRecord::Schema.define(version: 20170704230725) do

  create_table "bright_idea_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bright_idea_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bright_idea_id"], name: "index_bright_idea_likes_on_bright_idea_id"
    t.index ["user_id"], name: "index_bright_idea_likes_on_user_id"
  end

  create_table "bright_ideas", force: :cascade do |t|
    t.string   "idea"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bright_ideas_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bright_idea_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bright_idea_id"], name: "index_likes_on_bright_idea_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "alias"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
  end

end
