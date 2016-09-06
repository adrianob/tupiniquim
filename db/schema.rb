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

ActiveRecord::Schema.define(version: 20160906224329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_item_id"
    t.integer  "dessert_id"
    t.integer  "drink_id"
    t.integer  "restaurant_table_id"
    t.integer  "waiter_id",           null: false
    t.text     "state"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["dessert_id"], name: "index_client_orders_on_dessert_id", using: :btree
    t.index ["drink_id"], name: "index_client_orders_on_drink_id", using: :btree
    t.index ["menu_item_id"], name: "index_client_orders_on_menu_item_id", using: :btree
    t.index ["restaurant_table_id"], name: "index_client_orders_on_restaurant_table_id", using: :btree
    t.index ["user_id"], name: "index_client_orders_on_user_id", using: :btree
    t.index ["waiter_id"], name: "index_client_orders_on_waiter_id", using: :btree
  end

  create_table "desserts", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "details"
    t.decimal  "ambient_grade"
    t.decimal  "food_grade"
    t.decimal  "service_grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "menu_items", force: :cascade do |t|
    t.text     "description"
    t.decimal  "price",       precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "restaurant_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "password"
    t.text     "cpf"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
