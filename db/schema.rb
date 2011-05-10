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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110510072914) do

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "country_code"
    t.integer  "city_code"
    t.string   "address"
    t.string   "address_en"
    t.string   "office_tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "product_detail_entries", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_detail_id"
    t.integer  "user_id"
  end

  create_table "product_detail_organizations", :force => true do |t|
    t.integer  "product_detail_id"
    t.integer  "organization_id"
    t.string   "role"
    t.integer  "added_by_user"
    t.datetime "last_update"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "orgname"
  end

  create_table "product_details", :force => true do |t|
    t.integer  "product_id"
    t.float    "net_weight_g"
    t.string   "pkg_unit"
    t.integer  "shelf_life_d"
    t.string   "std_followed"
    t.string   "aggregate_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "product_organizations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "organization_id"
    t.string   "role"
    t.integer  "added_by_user"
    t.datetime "last_update"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scan_records", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "last_scan"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
