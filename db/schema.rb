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

ActiveRecord::Schema.define(version: 20160114083154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_standards", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "approvals", force: :cascade do |t|
    t.integer  "version_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "approvals", ["user_id"], name: "index_approvals_on_user_id", using: :btree
  add_index "approvals", ["version_id"], name: "index_approvals_on_version_id", using: :btree

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
    t.integer  "unit_id"
  end

  add_index "indicators", ["industry_id"], name: "index_indicators_on_industry_id", using: :btree
  add_index "indicators", ["unit_id"], name: "index_indicators_on_unit_id", using: :btree

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

  create_table "units", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "values", force: :cascade do |t|
    t.integer  "indicator_id"
    t.integer  "report_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
    t.integer  "currency_id"
  end

  add_index "values", ["currency_id"], name: "index_values_on_currency_id", using: :btree
  add_index "values", ["indicator_id"], name: "index_values_on_indicator_id", using: :btree
  add_index "values", ["report_id"], name: "index_values_on_report_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.string   "checker"
    t.integer  "maker_reward"
  end

  add_index "versions", ["report_id"], name: "index_versions_on_report_id", using: :btree
  add_index "versions", ["user_id"], name: "index_versions_on_user_id", using: :btree

end
