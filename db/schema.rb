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

ActiveRecord::Schema.define(version: 20160801212641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string   "name",                                           null: false
    t.integer  "model",                              default: 0, null: false
    t.decimal  "price",      precision: 8, scale: 2,             null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.datetime "returned_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rentals", ["bike_id"], name: "index_rentals_on_bike_id", using: :btree
  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rentals", "bikes"
  add_foreign_key "rentals", "users"

  create_view :bikes_reports, materialized: true,  sql_definition: <<-SQL
      SELECT bikes.name,
      bikes.model,
      count(rentals.id) AS times_rented,
      round((sum(((date_part('epoch'::text, (rentals.returned_at - rentals.created_at)) / (3600)::double precision) * (bikes.price)::double precision)))::numeric, 2) AS revenue
     FROM (rentals
       JOIN bikes ON ((bikes.id = rentals.bike_id)))
    GROUP BY bikes.id
    ORDER BY count(rentals.id) DESC;
  SQL

end
