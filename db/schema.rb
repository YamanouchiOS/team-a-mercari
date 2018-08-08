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

ActiveRecord::Schema.define(version: 20180806021655) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                       null: false
    t.integer  "postal_code",                   null: false
    t.integer  "prefecture",                    null: false
    t.string   "city",                          null: false
    t.string   "street_number",                 null: false
    t.string   "building_number",               null: false
    t.string   "phone_number",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_kana"
    t.string   "first_kana"
    t.text     "introduction",    limit: 65535
    t.index ["user_id"], name: "fk_rails_48c9e0c5a2", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "text",       limit: 65535, null: false
    t.integer  "user_id",                  null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "fk_rails_a0d280f6e4", using: :btree
    t.index ["user_id"], name: "fk_rails_03de2dc08c", using: :btree
  end

  create_table "large_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "fk_rails_f7ed05ee50", using: :btree
    t.index ["user_id"], name: "fk_rails_1e09b5dabf", using: :btree
  end

  create_table "middle_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",           null: false
    t.integer  "large_class_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["large_class_id"], name: "fk_rails_be2875f148", using: :btree
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id",      null: false
    t.integer  "large_class_id",  null: false
    t.integer  "middle_class_id", null: false
    t.integer  "small_class_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["large_class_id"], name: "fk_rails_314ce044d5", using: :btree
    t.index ["middle_class_id"], name: "fk_rails_57c4e718cb", using: :btree
    t.index ["product_id"], name: "fk_rails_98a9a32a41", using: :btree
    t.index ["small_class_id"], name: "fk_rails_722f097c6a", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "image",      null: false
    t.integer  "status",     null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "fk_rails_1c991d3be6", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                    null: false
    t.text     "detail",        limit: 65535,             null: false
<<<<<<< HEAD
    t.integer  "price",         limit: 4,                 null: false
    t.integer  "user_id",       limit: 4,                 null: false
    t.integer  "condition",     limit: 4,                 null: false
    t.integer  "delivery_cost", limit: 4,                 null: false
    t.integer  "prefecture",    limit: 4,                 null: false
    t.integer  "delivery_date", limit: 4,                 null: false
    t.integer  "status",        limit: 4,     default: 0, null: false
    t.integer  "likes_count",   limit: 4,     default: 0
=======
    t.integer  "price",                                   null: false
    t.integer  "user_id",                                 null: false
    t.integer  "condition",                               null: false
    t.integer  "delivery_cost",                           null: false
    t.integer  "prefecture",                              null: false
    t.integer  "delivery_date",                           null: false
    t.integer  "status",                                  null: false
    t.integer  "likes_count",                 default: 0
>>>>>>> master
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "fk_rails_dee2631783", using: :btree
  end

  create_table "small_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",            null: false
    t.integer  "middle_class_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["middle_class_id"], name: "fk_rails_f25fd54ff7", using: :btree
  end

<<<<<<< HEAD
  add_index "small_classes", ["middle_class_id"], name: "fk_rails_f25fd54ff7", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",  null: false
    t.string   "encrypted_password",     limit: 255, default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "nickname",               limit: 255,               null: false
    t.string   "products_count",         limit: 255, default: "0"
=======
  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname",                             null: false
    t.string   "products_count",         default: "0"
>>>>>>> master
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

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
