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

ActiveRecord::Schema.define(version: 2021_05_22_202703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "link_items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "source"
    t.string "image"
    t.string "price"
    t.bigint "user_id", null: false
    t.bigint "product_page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_page_id"], name: "index_link_items_on_product_page_id"
    t.index ["user_id"], name: "index_link_items_on_user_id"
  end

  create_table "product_pages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_product_pages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "link_items", "product_pages"
  add_foreign_key "link_items", "users"
  add_foreign_key "product_pages", "users"
end
