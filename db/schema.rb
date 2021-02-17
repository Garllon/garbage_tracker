# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_210_112_117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bottle_deposit_configurations', force: :cascade do |t|
    t.string 'name'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'bottle_deposit_storages', force: :cascade do |t|
    t.string 'name'
    t.integer 'amount'
    t.bigint 'bottle_deposit_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['bottle_deposit_id'], name: 'index_bottle_deposit_storages_on_bottle_deposit_id'
  end

  add_foreign_key 'bottle_deposit_storages', 'bottle_deposit_configurations', column: 'bottle_deposit_id'
end
