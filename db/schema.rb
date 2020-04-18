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

ActiveRecord::Schema.define(version: 2020_04_17_142646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bets", force: :cascade do |t|
    t.bigint "winner_id"
    t.bigint "casino_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["casino_id"], name: "index_bets_on_casino_id"
    t.index ["winner_id"], name: "index_bets_on_winner_id"
  end

  create_table "casinos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "bananas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deposits_on_user_id"
  end

  create_table "ledgerizer_accounts", force: :cascade do |t|
    t.string "tenant_type"
    t.bigint "tenant_id"
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.string "name"
    t.string "currency"
    t.string "account_type"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountable_type", "accountable_id", "name", "account_type", "currency", "tenant_id", "tenant_type"], name: "unique_account_index", unique: true
    t.index ["accountable_type", "accountable_id"], name: "index_ledgerizer_accounts_on_acc_type_and_acc_id"
    t.index ["tenant_type", "tenant_id"], name: "index_ledgerizer_accounts_on_tenant_type_and_tenant_id"
  end

  create_table "ledgerizer_entries", force: :cascade do |t|
    t.string "tenant_type"
    t.bigint "tenant_id"
    t.string "code"
    t.string "document_type"
    t.bigint "document_id"
    t.datetime "entry_time"
    t.index ["document_type", "document_id"], name: "index_ledgerizer_entries_on_document_type_and_document_id"
    t.index ["tenant_id", "tenant_type", "document_id", "document_type", "code"], name: "unique_entry_index", unique: true
    t.index ["tenant_type", "tenant_id"], name: "index_ledgerizer_entries_on_tenant_type_and_tenant_id"
  end

  create_table "ledgerizer_lines", force: :cascade do |t|
    t.string "tenant_type"
    t.bigint "tenant_id"
    t.bigint "entry_id"
    t.datetime "entry_time"
    t.string "entry_code"
    t.string "account_type"
    t.string "document_type"
    t.bigint "document_id"
    t.bigint "account_id"
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.string "account_name"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
    t.index ["account_id"], name: "index_ledgerizer_lines_on_account_id"
    t.index ["accountable_type", "accountable_id"], name: "index_ledgerizer_lines_on_accountable_type_and_accountable_id"
    t.index ["document_type", "document_id"], name: "index_ledgerizer_lines_on_document_type_and_document_id"
    t.index ["entry_id"], name: "index_ledgerizer_lines_on_entry_id"
    t.index ["tenant_type", "tenant_id"], name: "index_ledgerizer_lines_on_tenant_type_and_tenant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "casino_id"
    t.index ["casino_id"], name: "index_users_on_casino_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "bananas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_withdrawals_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deposits", "users"
  add_foreign_key "ledgerizer_lines", "ledgerizer_accounts", column: "account_id"
  add_foreign_key "ledgerizer_lines", "ledgerizer_entries", column: "entry_id"
  add_foreign_key "withdrawals", "users"
end
