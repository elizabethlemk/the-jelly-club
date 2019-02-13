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

ActiveRecord::Schema.define(version: 2019_02_13_185953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breads", force: :cascade do |t|
    t.string "name"
  end

  create_table "rating_rates", id: :serial, force: :cascade do |t|
    t.decimal "value", precision: 25, scale: 16, default: "0.0"
    t.string "author_type", null: false
    t.integer "author_id", null: false
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type"
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "author_type", "resource_id", "resource_type", "scopeable_id", "scopeable_type"], name: "index_rating_rates_on_author_and_resource_and_scopeable", unique: true
    t.index ["author_type", "author_id"], name: "index_rating_rates_on_author_type_and_author_id"
    t.index ["resource_type", "resource_id"], name: "index_rating_rates_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_rates_on_scopeable_type_and_scopeable_id"
  end

  create_table "rating_ratings", id: :serial, force: :cascade do |t|
    t.decimal "average", precision: 25, scale: 16, default: "0.0"
    t.decimal "estimate", precision: 25, scale: 16, default: "0.0"
    t.integer "sum", default: 0
    t.integer "total", default: 0
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type"
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id", "resource_type", "scopeable_id", "scopeable_type"], name: "index_rating_rating_on_resource_and_scopeable", unique: true
    t.index ["resource_type", "resource_id"], name: "index_rating_ratings_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_ratings_on_scopeable_type_and_scopeable_id"
  end

  create_table "sandwich_spreads", force: :cascade do |t|
    t.integer "spread_id"
    t.integer "sandwich_id"
  end

  create_table "sandwiches", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "bread_id"
    t.boolean "delicious"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spreads", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_feedbacks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sandwich_id"
    t.string "comment"
    t.boolean "favorite"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
