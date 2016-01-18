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

ActiveRecord::Schema.define(version: 20160114201528) do

  create_table "check_items", force: :cascade do |t|
    t.integer  "check_id",   limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "sub_total",  limit: 24, default: 0.0, null: false
    t.float    "total_tax",  limit: 24, default: 0.0, null: false
    t.integer  "quantity",   limit: 4,                null: false
  end

  add_index "check_items", ["check_id"], name: "index_check_items_on_check_id", using: :btree
  add_index "check_items", ["item_id"], name: "index_check_items_on_item_id", using: :btree

  create_table "checks", force: :cascade do |t|
    t.integer  "bill_num",     limit: 4,                null: false
    t.integer  "control_num",  limit: 4,                null: false
    t.integer  "client_id",    limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.float    "total_amount", limit: 24, default: 0.0, null: false
  end

  add_index "checks", ["client_id"], name: "index_checks_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",             limit: 255,   null: false
    t.text     "address",          limit: 65535, null: false
    t.string   "telephone_number", limit: 255,   null: false
    t.string   "identity",         limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255,               null: false
    t.float    "price",      limit: 24,  default: 0.0, null: false
    t.float    "tax",        limit: 24,  default: 0.0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_foreign_key "check_items", "checks"
  add_foreign_key "check_items", "items"
  add_foreign_key "checks", "clients"
end
