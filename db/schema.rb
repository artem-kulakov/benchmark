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

ActiveRecord::Schema.define(version: 20150816140447) do

  create_table "companies", force: true do |t|
    t.string   "title"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["industry_id"], name: "index_companies_on_industry_id"

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
  end

  create_table "industry_indicators", force: true do |t|
    t.integer  "industry_id"
    t.integer  "indicator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "industry_indicators", ["indicator_id"], name: "index_industry_indicators_on_indicator_id"
  add_index "industry_indicators", ["industry_id"], name: "index_industry_indicators_on_industry_id"

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "values", force: true do |t|
    t.integer  "indicator_id"
    t.integer  "report_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "values", ["indicator_id"], name: "index_values_on_indicator_id"
  add_index "values", ["report_id"], name: "index_values_on_report_id"

end
