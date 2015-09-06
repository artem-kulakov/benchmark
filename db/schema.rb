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

ActiveRecord::Schema.define(version: 20150906152610) do

  create_table "companies", force: true do |t|
    t.string   "title"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["industry_id"], name: "index_companies_on_industry_id"

  create_table "formulas", force: true do |t|
    t.integer  "indicator_id"
    t.string   "notation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "formulas", ["indicator_id"], name: "index_formulas_on_indicator_id"

  create_table "indicators", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industry_id"
    t.integer  "sequence"
  end

  add_index "indicators", ["industry_id"], name: "index_indicators_on_industry_id"

  create_table "industries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "initial_id"
  end

  add_index "industries", ["user_id"], name: "index_industries_on_user_id"

  create_table "periods", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "company_id"
    t.integer  "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["company_id"], name: "index_reports_on_company_id"
  add_index "reports", ["period_id"], name: "index_reports_on_period_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "values", force: true do |t|
    t.integer  "indicator_id"
    t.integer  "report_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "values", ["indicator_id"], name: "index_values_on_indicator_id"
  add_index "values", ["report_id"], name: "index_values_on_report_id"

end
