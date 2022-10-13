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

ActiveRecord::Schema.define(version: 2022_10_05_225622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "Member_id"
    t.bigint "Shift_id"
    t.integer "Hours"
    t.time "Start"
    t.time "End"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Member_id"], name: "index_attendances_on_Member_id"
    t.index ["Shift_id"], name: "index_attendances_on_Shift_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.decimal "Total_amount", precision: 8, scale: 2
    t.date "Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "Type"
    t.date "Date"
    t.string "Name"
    t.time "Start"
    t.time "End"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Email"
    t.boolean "Fall_Dues"
    t.boolean "Spring_Dues"
    t.string "Shirt_Size"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "Event_id"
    t.datetime "Start"
    t.datetime "End"
    t.integer "Shift_Cap"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Event_id"], name: "index_shifts_on_Event_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "Budget_id"
    t.string "Purpose"
    t.decimal "Amount", precision: 8, scale: 2
    t.string "Officer"
    t.date "Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Budget_id"], name: "index_transactions_on_Budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
