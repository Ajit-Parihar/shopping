# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_03_27_060531) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "add_to_carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_add_to_carts_on_product_id"
    t.index ["user_id"], name: "index_add_to_carts_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conform_orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_placed_order_id", null: false
    t.index ["user_id"], name: "index_conform_orders_on_user_id"
    t.index ["user_placed_order_id"], name: "index_conform_orders_on_user_placed_order_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "product_name"
    t.string "brand_name"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "user_id"
    t.integer "product_category_id"
    t.integer "seller_product_details_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["seller_product_details_id"], name: "index_products_on_seller_product_details_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "seller_product_categories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_category_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_seller_product_categories_on_product_category_id"
    t.index ["user_id"], name: "index_seller_product_categories_on_user_id"
  end

  create_table "seller_product_details", force: :cascade do |t|
    t.integer "productCount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "dist"
    t.string "block"
    t.string "town"
    t.integer "gali_no"
    t.integer "house_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_detail_id", null: false
    t.index ["user_detail_id"], name: "index_user_addresses_on_user_detail_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.integer "account_details"
    t.boolean "cod"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "user_placed_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "paimentMethod"
    t.boolean "deliver"
    t.boolean "cancel"
    t.boolean "pending"
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.datetime "start_time"
    t.index ["product_id"], name: "index_user_placed_orders_on_product_id"
    t.index ["user_id"], name: "index_user_placed_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "add_to_carts", "products"
  add_foreign_key "add_to_carts", "users"
  add_foreign_key "conform_orders", "user_placed_orders"
  add_foreign_key "conform_orders", "users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "seller_product_details", column: "seller_product_details_id", on_delete: :cascade
  add_foreign_key "products", "users"
  add_foreign_key "seller_product_categories", "product_categories"
  add_foreign_key "seller_product_categories", "users"
  add_foreign_key "user_addresses", "user_details"
  add_foreign_key "user_details", "users"
  add_foreign_key "user_placed_orders", "products"
  add_foreign_key "user_placed_orders", "users"
end
