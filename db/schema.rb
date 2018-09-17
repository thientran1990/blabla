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

ActiveRecord::Schema.define(version: 20180914083553) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "city_id",                null: false
    t.string   "ja_name",                null: false
    t.string   "en_name",                null: false
    t.integer  "position",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["city_id"], name: "index_areas_on_city_id", using: :btree
    t.index ["position"], name: "index_areas_on_position", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "ja_name",                null: false
    t.string   "en_name",                null: false
    t.integer  "position",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["position"], name: "index_categories_on_position", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "ja_name",                null: false
    t.string   "en_name",                null: false
    t.integer  "position",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["position"], name: "index_cities_on_position", using: :btree
  end

  create_table "districts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "city_id",                null: false
    t.string   "ja_name",                null: false
    t.string   "en_name",                null: false
    t.string   "vn_name",                null: false
    t.integer  "position",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["city_id"], name: "index_districts_on_city_id", using: :btree
    t.index ["position"], name: "index_districts_on_position", using: :btree
  end

  create_table "place_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "place_id"
    t.integer  "image_size"
    t.string   "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "ja_name",                                      null: false
    t.string   "ja_kana",                                      null: false
    t.string   "en_name",                                      null: false
    t.string   "slug",                                         null: false
    t.integer  "category_id",                                  null: false
    t.text     "description",    limit: 65535
    t.integer  "city_id",                                      null: false
    t.integer  "district_id"
    t.string   "vi_address"
    t.string   "ja_address"
    t.string   "en_address"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "area_id"
    t.string   "keywords"
    t.string   "tel"
    t.string   "url"
    t.string   "access"
    t.string   "seats"
    t.string   "booking"
    t.string   "smoking"
    t.string   "credit_cards"
    t.string   "shop_hour"
    t.string   "holiday"
    t.integer  "views",                        default: 0,     null: false
    t.integer  "views_in_week",                default: 0,     null: false
    t.integer  "views_in_month",               default: 0,     null: false
    t.integer  "image_id",                     default: 0,     null: false
    t.integer  "prior",                        default: 0,     null: false
    t.boolean  "published",                    default: false, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["area_id"], name: "index_places_on_area_id", using: :btree
    t.index ["category_id"], name: "index_places_on_category_id", using: :btree
    t.index ["city_id"], name: "index_places_on_city_id", using: :btree
    t.index ["district_id"], name: "index_places_on_district_id", using: :btree
    t.index ["en_address"], name: "index_places_on_en_address", using: :btree
    t.index ["en_name"], name: "index_places_on_en_name", using: :btree
    t.index ["ja_address"], name: "index_places_on_ja_address", using: :btree
    t.index ["ja_kana"], name: "index_places_on_ja_kana", using: :btree
    t.index ["ja_name"], name: "index_places_on_ja_name", using: :btree
    t.index ["keywords"], name: "index_places_on_keywords", using: :btree
    t.index ["latitude"], name: "index_places_on_latitude", using: :btree
    t.index ["longitude"], name: "index_places_on_longitude", using: :btree
    t.index ["prior"], name: "index_places_on_prior", using: :btree
    t.index ["vi_address"], name: "index_places_on_vi_address", using: :btree
    t.index ["views"], name: "index_places_on_views", using: :btree
    t.index ["views_in_month"], name: "index_places_on_views_in_month", using: :btree
    t.index ["views_in_week"], name: "index_places_on_views_in_week", using: :btree
  end

end
