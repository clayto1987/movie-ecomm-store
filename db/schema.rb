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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131108233440) do

  create_table "customers", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "postal_code"
    t.integer  "province_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "movieproductorders", :force => true do |t|
    t.integer  "movieproduct_id"
    t.integer  "order_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "movieproducts", :force => true do |t|
    t.string   "description"
    t.integer  "movie_id"
    t.decimal  "price"
    t.string   "product_type"
    t.integer  "stock_quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "image_path"
  end

  create_table "movies", :force => true do |t|
    t.string   "genre"
    t.string   "rating"
    t.integer  "runtime"
    t.string   "title"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "gst_rate"
    t.decimal  "hst_rate"
    t.decimal  "pst_rate"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "provinces", :force => true do |t|
    t.decimal  "gst"
    t.decimal  "hst"
    t.string   "name"
    t.decimal  "pst"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
