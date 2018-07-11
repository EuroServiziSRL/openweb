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

ActiveRecord::Schema.define(version: 2018_07_11_084929) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auth_hub_applicazioni_ente", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "ente_gestito_id"
    t.bigint "clienti__applicazione_id"
    t.index ["clienti__applicazione_id"], name: "index_auth_hub_applicazioni_ente_on_clienti__applicazione_id"
    t.index ["ente_gestito_id"], name: "index_auth_hub_applicazioni_ente_on_ente_gestito_id"
  end

  create_table "auth_hub_enti_gestiti", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "principale"
    t.bigint "user_id"
    t.bigint "clienti_cliente_id"
    t.index ["clienti_cliente_id"], name: "index_auth_hub_enti_gestiti_on_clienti_cliente_id"
    t.index ["user_id"], name: "index_auth_hub_enti_gestiti_on_user_id"
  end

  create_table "auth_hub_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome_cognome"
    t.string "nome"
    t.string "cognome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "password_changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "admin_servizi", default: false
    t.boolean "user_role", default: true
    t.string "provider"
    t.string "uid"
    t.text "jwt"
    t.datetime "jwt_created"
    t.string "stato"
    t.index ["email"], name: "index_auth_hub_users_on_email", unique: true
    t.index ["password_changed_at"], name: "index_auth_hub_users_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_auth_hub_users_on_reset_password_token", unique: true
  end

end
