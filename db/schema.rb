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

ActiveRecord::Schema.define(version: 20181218145143) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "action"
    t.integer  "quantity"
  end

  create_table "cuts", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "width"
    t.integer  "height"
    t.integer  "tracking_id"
    t.integer  "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "customer"
    t.string   "description"
    t.string   "priority"
    t.string   "delivery_address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "activated_date"
    t.text     "last_activation_message"
    t.integer  "status",                  default: 0
  end

  create_table "polish_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_lines", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "holes_quantity"
    t.integer  "polish_type_id"
    t.boolean  "tempered"
    t.integer  "quantity"
    t.string   "description"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "thickness"
    t.integer  "max_width"
    t.integer  "max_height"
    t.float    "price_per_m2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "stages", force: :cascade do |t|
    t.string   "name"
    t.float    "workload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackings", force: :cascade do |t|
    t.integer  "product_line_id"
    t.integer  "stage_id"
    t.integer  "done"
    t.integer  "next_tracking_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "prev_tracking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            default: "",    null: false
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_logs", force: :cascade do |t|
    t.integer  "tracking_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quantity"
  end

end
