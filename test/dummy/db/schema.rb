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

ActiveRecord::Schema.define(version: 20140222200422) do

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "cardboard_blog_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cardboard_blog_posts", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "body"
    t.integer  "visits"
    t.datetime "published_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cardboard_blog_tags", force: true do |t|
    t.string "name"
  end

  create_table "cardboard_fields", force: true do |t|
    t.string   "identifier"
    t.string   "type"
    t.text     "value_uid"
    t.integer  "object_with_field_id"
    t.string   "object_with_field_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cardboard_fields", ["identifier"], name: "index_cardboard_fields_on_identifier"
  add_index "cardboard_fields", ["object_with_field_id", "object_with_field_type"], name: "parent_object"

  create_table "cardboard_page_parts", force: true do |t|
    t.string   "identifier"
    t.integer  "position"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cardboard_page_parts", ["identifier"], name: "index_cardboard_page_parts_on_identifier"
  add_index "cardboard_page_parts", ["page_id"], name: "index_cardboard_page_parts_on_page_id"

  create_table "cardboard_pages", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.string   "slug"
    t.text     "slugs_backup"
    t.integer  "position"
    t.text     "meta_seo"
    t.boolean  "in_menu",      default: true
    t.string   "identifier"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cardboard_pages", ["identifier"], name: "index_cardboard_pages_on_identifier", unique: true
  add_index "cardboard_pages", ["path", "slug"], name: "index_cardboard_pages_on_path_and_slug", unique: true

  create_table "cardboard_settings", force: true do |t|
    t.string "name"
    t.text   "value"
    t.text   "default_value"
    t.text   "template"
  end

  add_index "cardboard_settings", ["name"], name: "index_cardboard_settings_on_name"

  create_table "cardboard_templates", force: true do |t|
    t.string   "name"
    t.text     "fields"
    t.string   "identifier"
    t.boolean  "is_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

end
