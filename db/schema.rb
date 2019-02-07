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

ActiveRecord::Schema.define(version: 20190205105808) do

  create_table "candidates", force: :cascade do |t|
    t.string   "candidatename"
    t.string   "education"
    t.string   "passportsizephoto"
    t.string   "fathername"
    t.string   "mothername"
    t.string   "contactaddress"
    t.string   "fathercontactnumber"
    t.string   "mothercontactnumber"
    t.string   "previousgrademarksheet"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "applicationstatus"
    t.string   "reason"
    t.string   "payment_status"
    t.integer  "grade_id"
    t.string   "appointment_date"
    t.string   "appointment_time"
    t.string   "appointment_place"
    t.index ["grade_id"], name: "index_candidates_on_grade_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "eligibilities", force: :cascade do |t|
    t.string   "section"
    t.string   "dateofbirthtill"
    t.string   "age"
    t.string   "dateason"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades_sections", id: false, force: :cascade do |t|
    t.integer "grade_id",   null: false
    t.integer "section_id", null: false
    t.index ["grade_id", "section_id"], name: "index_grades_sections_on_grade_id_and_section_id"
    t.index ["section_id", "grade_id"], name: "index_grades_sections_on_section_id_and_grade_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "shortlisting"
    t.string   "interview"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "candidate_id"
    t.boolean  "status",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["candidate_id"], name: "index_payments_on_candidate_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
  end

end
