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

ActiveRecord::Schema.define(version: 2019_04_13_162516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.bigint "variety_id"
    t.integer "quantity"
    t.string "stage"
    t.bigint "location_id"
    t.string "treatment"
    t.string "soil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "parent_id"
    t.index ["location_id"], name: "index_batches_on_location_id"
    t.index ["parent_id"], name: "index_batches_on_parent_id"
    t.index ["user_id"], name: "index_batches_on_user_id"
    t.index ["variety_id"], name: "index_batches_on_variety_id"
  end

  create_table "containers", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_item_batches", force: :cascade do |t|
    t.bigint "line_item_id"
    t.bigint "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["batch_id"], name: "index_line_item_batches_on_batch_id"
    t.index ["line_item_id"], name: "index_line_item_batches_on_line_item_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "variety_id"
    t.integer "quantity"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ship_week"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["variety_id"], name: "index_line_items_on_variety_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "po_number"
    t.string "region"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "billing_customer_id"
    t.index ["billing_customer_id"], name: "index_orders_on_billing_customer_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["container_id"], name: "index_varieties_on_container_id"
  end

  add_foreign_key "batches", "locations"
  add_foreign_key "batches", "users"
  add_foreign_key "batches", "varieties"
  add_foreign_key "line_item_batches", "batches"
  add_foreign_key "line_item_batches", "line_items"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "varieties"
  add_foreign_key "orders", "customers"
  add_foreign_key "varieties", "containers"
end
