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

ActiveRecord::Schema.define(version: 20160716124409) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "account",         limit: 255
    t.boolean  "del_mark",                    default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest", limit: 255
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachmenttable_type", limit: 255
    t.string   "attachmenttable_id",   limit: 255
    t.string   "file",                 limit: 255
    t.boolean  "del_mark",                         default: false
    t.integer  "rank",                 limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "category_type", limit: 4
    t.integer  "rank",          limit: 4
    t.boolean  "del_mark",                  default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.integer  "category_id",  limit: 4
    t.integer  "content_type", limit: 4
    t.text     "content",      limit: 65535
    t.string   "intro",        limit: 255
    t.integer  "rank",         limit: 4,     default: 0
    t.boolean  "del_mark",                   default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "link",         limit: 255
  end

  create_table "navs", force: :cascade do |t|
    t.string   "url",            limit: 255
    t.integer  "nav_type",       limit: 4
    t.integer  "rank",           limit: 4
    t.integer  "parent_id",      limit: 4
    t.integer  "lft",            limit: 4
    t.integer  "rgt",            limit: 4
    t.integer  "depth",          limit: 4,   default: 0
    t.integer  "children_count", limit: 4,   default: 0
    t.boolean  "del_mark",                   default: false
    t.string   "name",           limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "fb_name",     limit: 255
    t.string   "study_at",    limit: 255
    t.string   "phone",       limit: 255
    t.string   "price",       limit: 255
    t.string   "product_id",  limit: 255, default: "--- []\n"
    t.string   "count",       limit: 255, default: "--- []\n"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "trace_fb_id", limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "price",       limit: 255
    t.string   "intro",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
  end

  create_table "systems", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "keyword",     limit: 255
    t.string   "email",       limit: 255
    t.string   "phone",       limit: 255
    t.string   "fax",         limit: 255
    t.string   "address",     limit: 255
    t.string   "facebook",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
