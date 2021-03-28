# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_03_28_062732) do
=======
ActiveRecord::Schema.define(version: 2021_03_22_220625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
>>>>>>> 3e4e195ea5a00db392b302e18e487c5d6589b838

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.integer "weight", default: 0
    t.integer "products_counter", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["title"], name: "index_categories_on_title"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

<<<<<<< HEAD
  create_table "product_characteristics", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "color_id", null: false
    t.integer "size_id", null: false
    t.integer "amount"
=======
  create_table "product_colors", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "color_id", null: false
>>>>>>> 3e4e195ea5a00db392b302e18e487c5d6589b838
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_product_characteristics_on_color_id"
    t.index ["product_id"], name: "index_product_characteristics_on_product_id"
    t.index ["size_id"], name: "index_product_characteristics_on_size_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "weight", default: 0
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id", "weight"], name: "index_product_images_on_product_id_and_weight"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

<<<<<<< HEAD
=======
  create_table "product_sizes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "size_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_sizes_on_product_id"
    t.index ["size_id"], name: "index_product_sizes_on_size_id"
  end

>>>>>>> 3e4e195ea5a00db392b302e18e487c5d6589b838
  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.string "size", default: "s"
    t.string "status", default: "off"
    t.integer "amount", default: 0
    t.string "uuid"
    t.decimal "msrp", precision: 10, scale: 2
    t.decimal "price", precision: 10, scale: 2
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["status", "category_id"], name: "index_products_on_status_and_category_id"
    t.index ["title"], name: "index_products_on_title"
    t.index ["uuid"], name: "index_products_on_uuid", unique: true
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "user_id"
    t.string "user_uuid"
    t.integer "product_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
    t.index ["user_uuid"], name: "index_shopping_carts_on_user_uuid"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_sizes_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.string "uuid"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "product_characteristics", "colors"
  add_foreign_key "product_characteristics", "products"
  add_foreign_key "product_characteristics", "sizes"
  add_foreign_key "sizes", "categories"
end
