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

ActiveRecord::Schema.define(version: 20170731102836) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.string "code", limit: 50
    t.string "csv_output_code", limit: 50
    t.string "status"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_courses_on_product_id"
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.string "last4", limit: 4
    t.integer "card_type"
    t.date "expired_date"
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "info_on_student_portals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.text "summary"
    t.text "description"
    t.text "operating_environment"
    t.text "note"
    t.text "expiration_warning"
    t.boolean "is_visible_on_portals", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_info_on_student_portals_on_product_id"
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "title", default: "", null: false
    t.string "overview"
    t.text "body"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_notifications_on_product_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "paid_at"
    t.decimal "price", precision: 10, scale: 3, default: "0.0", null: false
    t.string "currency", limit: 10, default: "JPY", null: false
    t.string "status"
    t.text "description"
    t.bigint "purchase_id"
    t.bigint "credit_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_payments_on_credit_card_id"
    t.index ["purchase_id"], name: "index_payments_on_purchase_id"
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_plans_on_deleted_at"
    t.index ["product_id"], name: "index_plans_on_product_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", limit: 50
    t.string "status"
    t.string "name", default: "", null: false
    t.string "subtitle"
    t.string "website_title"
    t.string "website_url"
    t.string "catch_copy"
    t.string "image"
    t.text "description_on_corporate_portal"
    t.string "csv_import_format"
    t.integer "trial_length"
    t.string "trial_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.index ["product_id", "user_id"], name: "index_products_users_on_product_id_and_user_id"
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_id"
    t.bigint "plan_id", null: false
    t.bigint "service_id", null: false
    t.bigint "term_id"
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_programs_on_course_id"
    t.index ["plan_id"], name: "index_programs_on_plan_id"
    t.index ["service_id"], name: "index_programs_on_service_id"
    t.index ["term_id"], name: "index_programs_on_term_id"
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "auto_renew", default: false
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_purchases_on_service_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "service_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "payment_type"
    t.boolean "allow_cancellation", default: false
    t.boolean "is_card_required", default: false
    t.boolean "is_convenience_store_provided", default: false
    t.boolean "is_paisy_provided", default: false
    t.decimal "price", precision: 10, scale: 3
    t.decimal "tax", precision: 10, scale: 3
    t.text "price_announcement"
    t.boolean "allow_user_selection", default: false
    t.boolean "demo_available", default: false
    t.integer "user_type", default: 0, null: false
    t.string "status"
    t.bigint "service_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_group_id"], name: "index_services_on_service_group_id"
  end

  create_table "study_periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "open_at"
    t.datetime "end_at"
    t.bigint "program_id"
    t.bigint "purchase_id"
    t.index ["program_id"], name: "index_study_periods_on_program_id"
    t.index ["purchase_id"], name: "index_study_periods_on_purchase_id"
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "length", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["length"], name: "index_terms_on_length"
    t.index ["unit"], name: "index_terms_on_unit"
  end

  create_table "user_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.string "token", null: false
    t.string "refresh_token", null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "email", null: false
    t.string "password_digest"
    t.string "reset_pwd_token"
    t.boolean "is_email_confirmed", default: false
    t.string "confirm_email_token"
    t.datetime "confirm_token_expired_at"
    t.datetime "reset_pwd_expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "new_email"
  end

  add_foreign_key "courses", "products"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "info_on_student_portals", "products"
  add_foreign_key "notifications", "products"
  add_foreign_key "payments", "credit_cards"
  add_foreign_key "payments", "purchases"
  add_foreign_key "plans", "products"
  add_foreign_key "programs", "courses"
  add_foreign_key "programs", "plans"
  add_foreign_key "programs", "services"
  add_foreign_key "programs", "terms"
  add_foreign_key "purchases", "services"
  add_foreign_key "purchases", "users"
  add_foreign_key "study_periods", "programs"
  add_foreign_key "study_periods", "purchases"
  add_foreign_key "user_tokens", "users"
end
