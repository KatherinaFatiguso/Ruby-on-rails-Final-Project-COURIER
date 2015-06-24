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

ActiveRecord::Schema.define(version: 20150621234828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", default: "", null: false
    t.string   "last_name",  default: "", null: false
    t.string   "company",    default: "", null: false
    t.string   "phone1",     default: "", null: false
    t.string   "phone2"
    t.string   "email",      default: "", null: false
    t.string   "address",    default: "", null: false
    t.text     "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "sender",                                 null: false
    t.string   "from_address",                           null: false
    t.string   "receiver",                               null: false
    t.string   "to_address",                             null: false
    t.float    "from_latitude"
    t.float    "from_longitude"
    t.float    "to_latitude"
    t.float    "to_longitude"
    t.string   "status",            default: "new_task"
    t.text     "info"
    t.datetime "accepted_time"
    t.datetime "accomplished_time"
    t.boolean  "sign_required",     default: false
    t.boolean  "signed",            default: false
    t.integer  "item_count",        default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",                                 null: false
    t.string   "last_name",              default: "",                                 null: false
    t.float    "curr_lat",               default: -33.889242
    t.float    "curr_long",              default: 151.199098
    t.string   "curr_addr",              default: "7 Hudson Street Redfern NSW 2016"
    t.string   "email",                  default: "",                                 null: false
    t.string   "encrypted_password",     default: "",                                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
