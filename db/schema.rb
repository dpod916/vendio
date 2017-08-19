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

ActiveRecord::Schema.define(version: 20170816173736) do

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
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_consultants_on_vendor_id"
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

end
