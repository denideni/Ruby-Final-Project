# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema
# definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more
# migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version
# control system.

ActiveRecord::Schema.define(version: 2018_04_15_080159) do
  create_table 'friendships', force: :cascade do |t|
    t.integer 'person_1_id'
    t.integer 'person_2_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['person_1_id'], name: 'index_friendships_on_person_1_id'
    t.index ['person_2_id'], name: 'index_friendships_on_person_2_id'
  end
  create_table 'payments', force: :cascade do |t|
    t.float 'payment_amount'
    t.integer 'requester_id'
    t.integer 'payer_id'
    t.datetime 'time_of_payment'
    t.text 'reason_for_payment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['payer_id'], name: 'index_payments_on_payer_id'
    t.index ['requester_id'], name: 'index_payments_on_requester_id'
  end
  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone_number'
    t.string 'email'
    t.string 'password_hash'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
