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

ActiveRecord::Schema.define(version: 20191021002634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organisation_enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_organisation_enrollments_on_organisation_id"
    t.index ["user_id", "organisation_id"], name: "index_organisation_enrollments_on_user_id_and_organisation_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.float "hourly_rate"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "start"
    t.datetime "finish"
    t.integer "break_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organisation_enrollment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
