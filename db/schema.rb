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
<<<<<<< HEAD

ActiveRecord::Schema.define(version: 20181116122310) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.integer "category_l_id", null: false
    t.index ["category_l_id"], name: "index_brands_on_category_l_id", using: :btree
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "category_ls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "category_ms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",          null: false
    t.integer "category_l_id", null: false
    t.index ["category_l_id"], name: "index_category_ms_on_category_l_id", using: :btree
  end

  create_table "category_s", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",          null: false
    t.integer "category_m_id", null: false
    t.index ["category_m_id"], name: "index_category_s_on_category_m_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "comment", limit: 65535, null: false
    t.integer "item_id",               null: false
    t.integer "user_id",               null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "deal_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text   "message", limit: 65535, null: false
    t.string "deal_id",               null: false
    t.string "user_id",               null: false
  end

  create_table "deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",   null: false
    t.datetime "dealt_at",  null: false
    t.integer  "seller_id", null: false
    t.integer  "buyer_id",  null: false
    t.index ["item_id"], name: "index_deals_on_item_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "image_url", null: false
    t.integer "user_id",   null: false
    t.index ["user_id"], name: "index_images_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",          limit: 60,    null: false
    t.integer "price",                       null: false
    t.string  "condition",                   null: false
    t.text    "description",   limit: 65535, null: false
    t.string  "shipping_fee",                null: false
    t.string  "arrived_date",                null: false
    t.integer "like_count",                  null: false
    t.integer "category_s_id",               null: false
    t.integer "category_m_id",               null: false
    t.integer "category_l_id",               null: false
    t.integer "size_id",                     null: false
    t.integer "seller_id"
    t.integer "buyer_id"
    t.string  "image_url"
    t.index ["category_l_id"], name: "index_items_on_category_l_id", using: :btree
    t.index ["category_m_id"], name: "index_items_on_category_m_id", using: :btree
    t.index ["category_s_id"], name: "index_items_on_category_s_id", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category_s_id", null: false
    t.string "name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",               limit: 20
    t.string   "email",                                             null: false
    t.string   "encrypted_password",                                null: false
    t.text     "profile",                limit: 65535
    t.string   "phone_number",                         default: ""
    t.string   "first_name",             limit: 35
    t.string   "last_name",              limit: 35
    t.string   "first_name_kana",        limit: 35
    t.string   "last_name_kana",         limit: 35
    t.string   "zipcode"
    t.string   "prefecture"
    t.string   "city"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "birthday"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.index ["email", "reset_password_token"], name: "index_users_on_email_and_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "category_ms", "category_ls"
  add_foreign_key "category_s", "category_ms"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "deals", "items"
  add_foreign_key "images", "users"
  add_foreign_key "items", "category_ls"
  add_foreign_key "items", "category_ms"
  add_foreign_key "items", "category_s", column: "category_s_id"
  add_foreign_key "items", "sizes"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
=======
>>>>>>> Mame1209/master
