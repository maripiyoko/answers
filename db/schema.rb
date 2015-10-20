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

ActiveRecord::Schema.define(version: 20151020132725) do

  create_table "answers", force: :cascade do |t|
    t.integer  "answer_type", limit: 4,     default: 0
    t.integer  "topic_id",    limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "message",     limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "answers", ["topic_id"], name: "index_answers_on_topic_id", using: :btree
  add_index "answers", ["user_id", "id"], name: "index_answers_on_user_id_and_id", unique: true, using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "topic_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "topic_type",    limit: 255
    t.datetime "start_date"
    t.string   "place",         limit: 255
    t.datetime "deadline_date"
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "content",       limit: 65535
    t.datetime "end_date"
    t.string   "state",         limit: 255,   default: "WIP"
  end

  add_index "topics", ["user_id", "created_at"], name: "index_topics_on_user_id_and_created_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "topics"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
end
