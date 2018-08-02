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

ActiveRecord::Schema.define(version: 20180731042712) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,   null: false
    t.integer  "postal_code",     limit: 4,   null: false
    t.integer  "prefecture",      limit: 4,   null: false
    t.string   "city",            limit: 255, null: false
    t.string   "street_number",   limit: 255, null: false
    t.string   "building_number", limit: 255, null: false
    t.string   "phone_number",    limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "fk_rails_48c9e0c5a2", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "text",       limit: 65535, null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.integer  "product_id", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["product_id"], name: "fk_rails_a0d280f6e4", using: :btree
  add_index "comments", ["user_id"], name: "fk_rails_03de2dc08c", using: :btree

  create_table "large_classes", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "product_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["product_id"], name: "fk_rails_f7ed05ee50", using: :btree
  add_index "likes", ["user_id"], name: "fk_rails_1e09b5dabf", using: :btree

  create_table "middle_classes", force: :cascade do |t|
    t.string   "name",           limit: 255, null: false
    t.integer  "large_class_id", limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "middle_classes", ["large_class_id"], name: "fk_rails_be2875f148", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id",      limit: 4, null: false
    t.integer  "large_class_id",  limit: 4, null: false
    t.integer  "middle_class_id", limit: 4, null: false
    t.integer  "small_class_id",  limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categories", ["large_class_id"], name: "fk_rails_314ce044d5", using: :btree
  add_index "product_categories", ["middle_class_id"], name: "fk_rails_57c4e718cb", using: :btree
  add_index "product_categories", ["product_id"], name: "fk_rails_98a9a32a41", using: :btree
  add_index "product_categories", ["small_class_id"], name: "fk_rails_722f097c6a", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.string   "image",      limit: 255, null: false
    t.integer  "status",     limit: 4,   null: false
    t.integer  "product_id", limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_images", ["product_id"], name: "fk_rails_1c991d3be6", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",          limit: 255,               null: false
    t.text     "detail",        limit: 65535,             null: false
    t.integer  "price",         limit: 4,                 null: false
    t.integer  "user_id",       limit: 4,                 null: false
    t.integer  "condition",     limit: 4,                 null: false
    t.integer  "delivery_cost", limit: 4,                 null: false
    t.integer  "prefecture",    limit: 4,                 null: false
    t.integer  "delivery_date", limit: 4,                 null: false
    t.integer  "status",        limit: 4,                 null: false
    t.integer  "likes_count",   limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id"], name: "fk_rails_dee2631783", using: :btree

  create_table "small_classes", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.integer  "middle_class_id", limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "small_classes", ["middle_class_id"], name: "fk_rails_f25fd54ff7", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",  null: false
    t.string   "encrypted_password",     limit: 255,   default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "nickname",               limit: 255,                 null: false
    t.string   "password",               limit: 255,                 null: false
    t.string   "products_count",         limit: 255,   default: "0"
    t.string   "family_name",            limit: 255
    t.string   "first_name",             limit: 255
    t.string   "family_kana",            limit: 255
    t.string   "first_kana",             limit: 255
    t.integer  "gender",                 limit: 4
    t.text     "introduction",           limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "middle_classes", "large_classes"
  add_foreign_key "product_categories", "large_classes"
  add_foreign_key "product_categories", "middle_classes"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_categories", "small_classes"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "users"
  add_foreign_key "small_classes", "middle_classes"
end
