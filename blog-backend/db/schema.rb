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

ActiveRecord::Schema.define(version: 2023_03_08_123727) do

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "cover", null: false
    t.integer "author_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_blogs_on_author_id"
    t.index ["category_id"], name: "index_blogs_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.index ["name"], name: "index_categories_on_name"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  add_foreign_key "blogs", "authors"
  add_foreign_key "blogs", "categories"
  add_foreign_key "categories", "categories", column: "parent_id", on_delete: :nullify
end
