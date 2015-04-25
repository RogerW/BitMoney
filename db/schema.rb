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

ActiveRecord::Schema.define(version: 20150422064956) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "is_default"
    t.string   "description"
    t.integer  "balance_cents",    default: 0,     null: false
    t.string   "balance_currency", default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "consumption_types", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  add_index "consumption_types", ["user_id"], name: "index_consumption_types_on_user_id"

  create_table "consumptions", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "consumption_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumptions", ["consumption_type_id"], name: "index_consumptions_on_consumption_type_id"
  add_index "consumptions", ["invoice_id"], name: "index_consumptions_on_invoice_id"

  create_table "invoices", force: true do |t|
    t.integer  "account_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invtype"
  end

  add_index "invoices", ["account_id"], name: "index_invoices_on_account_id"

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
