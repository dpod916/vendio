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

ActiveRecord::Schema.define(version: 20170823030812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", id: :serial, force: :cascade do |t|
    t.integer "old_id"
    t.integer "agreement_number"
    t.string "agreement_version"
    t.text "added_text"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultants", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.float "amount"
    t.string "per"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.string "termable_type"
    t.bigint "termable_id"
    t.integer "version"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["termable_type", "termable_id"], name: "index_terms_on_termable_type_and_termable_id"
  end

  create_table "vendor_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "vendor_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "vendor_desc_idx"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "legal_name"
    t.string "type"
    t.integer "parent_id"
    t.float "lng"
    t.float "lat"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "website"
  end

  create_table "work_order_consultants", force: :cascade do |t|
    t.bigint "work_order_id"
    t.bigint "consultant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultant_id"], name: "index_work_order_consultants_on_consultant_id"
    t.index ["work_order_id"], name: "index_work_order_consultants_on_work_order_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.bigint "vendor_id"
    t.integer "company_id"
    t.bigint "agreement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_work_orders_on_agreement_id"
    t.index ["vendor_id"], name: "index_work_orders_on_vendor_id"
  end

  add_foreign_key "work_order_consultants", "consultants"
  add_foreign_key "work_order_consultants", "work_orders"
  add_foreign_key "work_orders", "agreements"
  add_foreign_key "work_orders", "vendors"
end
