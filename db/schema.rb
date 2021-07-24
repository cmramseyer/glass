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

ActiveRecord::Schema.define(version: 2021_07_24_192930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "object_id"
    t.string "object_type"
    t.string "action"
    t.integer "quantity"
  end

  create_table "cuts", id: :serial, force: :cascade do |t|
    t.integer "program_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width"
    t.integer "height"
    t.integer "tracking_id"
    t.integer "quantity"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "customer"
    t.string "description"
    t.string "priority"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "activated_date"
    t.text "last_activation_message"
    t.integer "status", default: 0
  end

  create_table "polish_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_lines", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "holes_quantity"
    t.integer "polish_type_id"
    t.boolean "tempered"
    t.integer "quantity"
    t.string "description"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "thickness"
    t.integer "max_width"
    t.integer "max_height"
    t.float "price_per_m2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "stages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.float "workload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackings", id: :serial, force: :cascade do |t|
    t.integer "product_line_id"
    t.integer "stage_id"
    t.integer "done"
    t.integer "next_tracking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prev_tracking_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_logs", id: :serial, force: :cascade do |t|
    t.integer "tracking_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end


  create_view "historical_surface_and_weight_mvw", materialized: true, sql_definition: <<-SQL
      SELECT p.name,
      p.code,
      round(sum(((((pl.quantity * pl.width) * pl.height))::numeric / (1000000)::numeric)), 2) AS total_area,
      round(sum(((((((pl.quantity * pl.width) * pl.height) * p.thickness))::numeric * 2.5) / (1000000)::numeric)), 2) AS total_weight
     FROM (products p
       LEFT JOIN product_lines pl ON ((p.id = pl.product_id)))
    GROUP BY p.name, p.code;
  SQL
  create_view "last_days_workload_mvw", materialized: true, sql_definition: <<-SQL
      SELECT s.name,
      (wl.created_at)::date AS created_at,
      round(sum((((((wl.quantity)::numeric * (s.workload)::numeric) * (pl.width)::numeric) * (pl.height)::numeric) / 1000000.0)), 2) AS workload
     FROM (((work_logs wl
       JOIN trackings t ON ((t.id = wl.tracking_id)))
       JOIN stages s ON ((t.stage_id = s.id)))
       JOIN product_lines pl ON ((pl.id = t.product_line_id)))
    WHERE (wl.created_at > (('now'::text)::date - '14 days'::interval))
    GROUP BY s.name, (wl.created_at)::date;
  SQL
end
