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

ActiveRecord::Schema.define(version: 2021_04_13_152104) do

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

  create_table "auth_hub_info_login_cliente", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "org_name", null: false
    t.string "org_display_name", null: false
    t.string "org_url", null: false
    t.string "key_path"
    t.string "cert_path"
    t.boolean "app_ext"
    t.string "secret", null: false
    t.string "client", null: false
    t.string "url_app_ext"
    t.string "url_ass_cons_ext"
    t.string "url_metadata_ext"
    t.string "url_ass_cons_ext_cie"
    t.string "url_metadata_ext_cie"
    t.string "issuer", null: false
    t.boolean "spid"
    t.boolean "spid_pre_prod"
    t.boolean "cie"
    t.boolean "cie_pre_prod"
    t.boolean "eidas"
    t.boolean "eidas_pre_prod"
    t.boolean "aggregato"
    t.string "cod_ipa_aggregato", null: false
    t.string "p_iva_aggregato", null: false
    t.string "cf_aggregato", null: false
    t.string "stato_metadata", null: false
    t.bigint "clienti_cliente_id"
    t.string "email_aggregato", null: false
    t.string "telefono_aggregato"
    t.string "index_consumer"
    t.string "campi_richiesti"
    t.string "belfiore_aggregato", null: false
    t.index ["clienti_cliente_id"], name: "index_auth_hub_info_login_cliente_on_clienti_cliente_id"
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
    t.string "ente"
    t.string "telefono"
    t.boolean "wiki_hd"
    t.index ["email"], name: "index_auth_hub_users_on_email", unique: true
    t.index ["password_changed_at"], name: "index_auth_hub_users_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_auth_hub_users_on_reset_password_token", unique: true
  end

  create_table "oauth_access_grants", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.bigint "application_id"
    t.text "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  end

  create_table "oauth_applications", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "old_passwords", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.integer "password_archivable_id", null: false
    t.string "password_salt"
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "wiki_hd_allegati", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nome"
    t.string "dimensione"
    t.bigint "soluzione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soluzione_id"], name: "index_wiki_hd_allegati_on_soluzione_id"
  end

  create_table "wiki_hd_segnalazioni", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "nome_cognome"
    t.string "email"
    t.string "stato"
    t.text "testo_segnalazione"
    t.text "testo_risposta"
    t.bigint "auth_hub_clienti_cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_hub_clienti_cliente_id"], name: "index_wiki_hd_segnalazioni_on_auth_hub_clienti_cliente_id"
  end

  create_table "wiki_hd_soluzioni", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "problematica"
    t.text "testo_soluzione"
    t.bigint "auth_hub_user_id"
    t.bigint "auth_hub_clienti_applicazione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_hub_clienti_applicazione_id"], name: "index_wiki_hd_soluzioni_on_auth_hub_clienti_applicazione_id"
    t.index ["auth_hub_user_id"], name: "index_wiki_hd_soluzioni_on_auth_hub_user_id"
  end

  create_table "wiki_hd_soluzioni_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "soluzione_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soluzione_id"], name: "index_wiki_hd_soluzioni_tags_on_soluzione_id"
    t.index ["tag_id"], name: "index_wiki_hd_soluzioni_tags_on_tag_id"
  end

  create_table "wiki_hd_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_wiki_hd_tags_on_nome", unique: true
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "wiki_hd_soluzioni", "auth_hub_users"
end
