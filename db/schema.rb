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

ActiveRecord::Schema.define(version: 20160912153706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "desserts", force: :cascade do |t|
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "client_id",     null: false
    t.text     "details"
    t.decimal  "ambient_grade"
    t.decimal  "food_grade"
    t.decimal  "service_grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "index_feedbacks_on_client_id", using: :btree
  end

  create_table "menu_items", force: :cascade do |t|
    t.text     "description"
    t.decimal  "price",       precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "order_detail_transitions", force: :cascade do |t|
    t.string   "to_state",                     null: false
    t.json     "metadata",        default: {}
    t.integer  "sort_key",                     null: false
    t.integer  "order_detail_id",              null: false
    t.boolean  "most_recent",                  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["order_detail_id", "most_recent"], name: "index_order_detail_transitions_parent_most_recent", unique: true, where: "most_recent", using: :btree
    t.index ["order_detail_id", "sort_key"], name: "index_order_detail_transitions_parent_sort", unique: true, using: :btree
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "menu_item_id", null: false
    t.integer  "dessert_id"
    t.integer  "drink_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["dessert_id"], name: "index_order_details_on_dessert_id", using: :btree
    t.index ["drink_id"], name: "index_order_details_on_drink_id", using: :btree
    t.index ["menu_item_id"], name: "index_order_details_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_order_details_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id",  null: false
    t.integer  "waiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id", using: :btree
    t.index ["waiter_id"], name: "index_orders_on_waiter_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "password"
    t.text     "cpf"
    t.string   "type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
