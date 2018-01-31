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

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "account"
    t.boolean  "del_mark",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "attachmenttable_type"
    t.string   "attachmenttable_id"
    t.string   "file"
    t.boolean  "del_mark",             default: false
    t.integer  "rank"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_type"
    t.integer  "rank"
    t.boolean  "del_mark",      default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "content_type"
    t.text     "content",      limit: 65535
    t.string   "intro"
    t.integer  "rank",                       default: 0
    t.boolean  "del_mark",                   default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "link",                                                    collation: "latin1_swedish_ci"
  end

  create_table "navs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "url",                                         collation: "utf8_general_ci"
    t.integer  "nav_type"
    t.integer  "rank"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",          default: 0
    t.integer  "children_count", default: 0
    t.boolean  "del_mark",       default: false
    t.string   "name",                                        collation: "utf8_general_ci"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "fb_name"
    t.string   "study_at"
    t.string   "phone"
    t.string   "price"
    t.string   "product_id",  default: "--- []\n"
    t.string   "count",       default: "--- []\n"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "trace_fb_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "price"
    t.string   "intro"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "keyword"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "address"
    t.string   "facebook"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
