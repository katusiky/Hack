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

ActiveRecord::Schema.define(version: 20160119142646) do

  create_table "bills", force: :cascade do |t|
    t.integer  "bill_num",         limit: 8,   default: 0,   null: false
    t.string   "name",             limit: 255,               null: false
    t.string   "telephone_number", limit: 255,               null: false
    t.string   "identity",         limit: 255,               null: false
    t.float    "item",             limit: 24,  default: 0.0, null: false
    t.integer  "quantity",         limit: 8,   default: 0,   null: false
    t.float    "sub_total",        limit: 24,  default: 0.0, null: false
    t.float    "total_tax",        limit: 24,  default: 0.0, null: false
    t.float    "total_amount",     limit: 24,  default: 0.0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
