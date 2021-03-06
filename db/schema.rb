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

ActiveRecord::Schema.define(version: 20180816050649) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                       null: false
    t.string   "postal_code",                   null: false
    t.integer  "prefecture",                    null: false
    t.string   "city",                          null: false
    t.string   "street_number",                 null: false
    t.string   "building_number",               null: false
    t.string   "phone_number",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "family_name",                   null: false
    t.string   "first_name",                    null: false
    t.string   "family_kana",                   null: false
    t.string   "first_kana",                    null: false
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
    t.string   "image"
    t.integer  "status",     null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "fk_rails_1c991d3be6", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                    null: false
    t.text     "detail",        limit: 65535,             null: false
    t.integer  "price",                                   null: false
    t.integer  "condition",                               null: false
    t.integer  "delivery_cost",                           null: false
    t.integer  "prefecture",                              null: false
    t.integer  "delivery_date",                           null: false
    t.integer  "status",                      default: 0, null: false
    t.integer  "likes_count",                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                 null: false
    t.integer  "buyer_id"
    t.datetime "purchased_at"
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "grade",                     null: false
    t.text     "text",        limit: 65535
    t.integer  "status",                    null: false
    t.integer  "reviewer_id",               null: false
    t.integer  "reviewee_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id", using: :btree
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree
  end

  create_table "small_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",            null: false
    t.integer  "middle_class_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["middle_class_id"], name: "fk_rails_f25fd54ff7", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname",                            null: false
    t.integer  "products_count",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
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
  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "small_classes", "middle_classes"
end
