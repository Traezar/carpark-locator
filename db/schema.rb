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

ActiveRecord::Schema.define(version: 2021_08_05_180135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carpark_lots", force: :cascade do |t|
    t.integer "total_lots"
    t.integer "lots_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "carpark_id"
    t.index ["carpark_id"], name: "index_carpark_lots_on_carpark_id"
  end

  create_table "carparks", force: :cascade do |t|
    t.string "short_term_parking"
    t.string "carpark_type"
    t.string "y_coord"
    t.string "x_coord"
    t.string "address"
    t.string "carpark_decks"
    t.string "source_id"
    t.string "carpark_no"
    t.string "type_of_parking_system"
    t.float "gantry_height"
    t.boolean "free_parking"
    t.boolean "night_parking"
    t.boolean "carpark_basement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_id", "carpark_no"], name: "index_carparks_on_source_id_and_carpark_no", unique: true
  end

end
