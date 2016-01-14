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

ActiveRecord::Schema.define(version: 20_160_113_122_831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'street'
    t.string 'number'
    t.string 'complement'
    t.string 'neighborhood'
    t.string 'city'
    t.string 'state'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
    t.integer 'service_id'
  end

  create_table 'areas', force: :cascade do |t|
    t.string 'area'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'services', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'phone'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.integer 'subarea_id'
  end

  create_table 'subareas', force: :cascade do |t|
    t.string 'subarea'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'area_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email',                  default: '', null: false
    t.string 'encrypted_password',     default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string 'social_name'
    t.string 'civil_name'
    t.date 'birth_date'
    t.string 'username'
    t.string 'phone_number'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
end
