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

ActiveRecord::Schema.define(version: 20160204123121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_standards", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  add_index "companies", ["industry_id"], name: "index_companies_on_industry_id", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: :cascade do |t|
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulas", force: :cascade do |t|
    t.integer  "indicator_id"
    t.string   "notation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "formulas", ["indicator_id"], name: "index_formulas_on_indicator_id", using: :btree

  create_table "fx_rates", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "currency_id"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fx_rates", ["currency_id"], name: "index_fx_rates_on_currency_id", using: :btree
  add_index "fx_rates", ["day_id"], name: "index_fx_rates_on_day_id", using: :btree

  create_table "indicators", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industry_id"
    t.integer  "sequence"
  end

  add_index "indicators", ["industry_id"], name: "index_indicators_on_industry_id", using: :btree

  create_table "industries", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "periods", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_id"
  end

  add_index "periods", ["day_id"], name: "index_periods_on_day_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accounting_standard_id"
    t.integer  "rating"
    t.integer  "maker_id"
    t.integer  "maker_reward"
    t.integer  "checker_id"
  end

  add_index "reports", ["accounting_standard_id"], name: "index_reports_on_accounting_standard_id", using: :btree
  add_index "reports", ["company_id"], name: "index_reports_on_company_id", using: :btree
  add_index "reports", ["period_id"], name: "index_reports_on_period_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "values", force: :cascade do |t|
    t.integer  "indicator_id"
    t.integer  "report_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "currency_id"
  end

  add_index "values", ["currency_id"], name: "index_values_on_currency_id", using: :btree
  add_index "values", ["indicator_id"], name: "index_values_on_indicator_id", using: :btree
  add_index "values", ["report_id"], name: "index_values_on_report_id", using: :btree

  add_foreign_key "topics", "users"
end
