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

ActiveRecord::Schema.define(version: 20160115154853) do

  create_table "basic_materials", force: :cascade do |t|
    t.string   "name",          limit: 255,             null: false
    t.string   "picture",       limit: 255,             null: false
    t.integer  "require_level", limit: 4,   default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",                 limit: 255, default: "NewCity", null: false
    t.integer  "population",           limit: 4,   default: 0,         null: false
    t.integer  "happiness_percentage", limit: 4,   default: 100,       null: false
    t.integer  "money",                limit: 4,   default: 1000,      null: false
    t.integer  "level",                limit: 4,   default: 1,         null: false
    t.integer  "mayor_id",             limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "cities", ["mayor_id"], name: "index_cities_on_mayor_id", using: :btree

  create_table "commercial_buildings", force: :cascade do |t|
    t.integer  "city_id",        limit: 4
    t.string   "name",           limit: 255,              null: false
    t.integer  "required_level", limit: 4,   default: 0,  null: false
    t.integer  "capacity",       limit: 4,   default: 10, null: false
    t.integer  "position_X",     limit: 4
    t.integer  "position_y",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "commercial_buildings", ["city_id"], name: "index_commercial_buildings_on_city_id", using: :btree

  create_table "complex_materials", force: :cascade do |t|
    t.integer  "commercial_building_id", limit: 4
    t.string   "name",                   limit: 255,             null: false
    t.integer  "required_level",         limit: 4,   default: 5, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "complex_materials", ["commercial_building_id"], name: "index_complex_materials_on_commercial_building_id", using: :btree

  create_table "factories", force: :cascade do |t|
    t.integer  "city_id",         limit: 4
    t.integer  "factory_type_id", limit: 4
    t.integer  "position_x",      limit: 4
    t.integer  "position_y",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "factories", ["city_id"], name: "index_factories_on_city_id", using: :btree
  add_index "factories", ["factory_type_id"], name: "index_factories_on_factory_type_id", using: :btree

  create_table "factory_basic_materials", force: :cascade do |t|
    t.integer  "factory_id",        limit: 4
    t.integer  "basic_material_id", limit: 4
    t.integer  "quantity",          limit: 4, null: false
    t.integer  "status",            limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "factory_basic_materials", ["basic_material_id"], name: "index_factory_basic_materials_on_basic_material_id", using: :btree
  add_index "factory_basic_materials", ["factory_id"], name: "index_factory_basic_materials_on_factory_id", using: :btree

  create_table "factory_types", force: :cascade do |t|
    t.string   "name",           limit: 255,             null: false
    t.integer  "price",          limit: 4,   default: 0, null: false
    t.integer  "required_level", limit: 4,   default: 0, null: false
    t.integer  "capacity",       limit: 4,               null: false
    t.integer  "dirt_radious_x", limit: 4
    t.integer  "dirt_radious_y", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "material_relations", force: :cascade do |t|
    t.integer  "complex_material_id", limit: 4
    t.integer  "basic_material_id",   limit: 4
    t.integer  "required_quantity",   limit: 4, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "material_relations", ["basic_material_id"], name: "index_material_relations_on_basic_material_id", using: :btree
  add_index "material_relations", ["complex_material_id"], name: "index_material_relations_on_complex_material_id", using: :btree

  create_table "mayors", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.integer  "ref_number", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "cities", "mayors"
  add_foreign_key "commercial_buildings", "cities"
  add_foreign_key "complex_materials", "commercial_buildings"
  add_foreign_key "factories", "cities"
  add_foreign_key "factories", "factory_types"
  add_foreign_key "factory_basic_materials", "basic_materials"
  add_foreign_key "factory_basic_materials", "factories"
  add_foreign_key "material_relations", "basic_materials"
  add_foreign_key "material_relations", "complex_materials"
end
