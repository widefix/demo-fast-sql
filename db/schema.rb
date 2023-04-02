ActiveRecord::Schema[7.0].define(version: 2023_03_30_161714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "order", null: false
    t.boolean "active", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["slug"], name: "unique_categories", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Open"
    t.string "category"
    t.string "experience"
    t.string "existing_website"
    t.string "existing_website_platform"
    t.string "category_tasks", array: true
    t.string "delivery_timeline"
    t.string "budget"
    t.string "language_preference", array: true
    t.string "location_preference"
    t.json "raw_json"
    t.bigint "vendor_id"
    t.json "project_data"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "reviewer_id"
    t.bigint "reviewee_id"
    t.integer "rating"
    t.text "review"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["status"], name: "index_services_on_status"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "external_user_id"
    t.bigint "account_id"
    t.string "name"
    t.string "email"
    t.string "given_name"
    t.string "family_name"
    t.string "nickname"
    t.string "picture"
    t.boolean "employee_account"
    t.boolean "developer_account"
    t.string "user_type"
    t.datetime "external_updated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ratings_total"
    t.integer "ratings_count"
    t.string "languages", array: true
    t.string "location"
    t.string "website"
    t.string "vendor_company"
    t.datetime "terms_accepted_at"
    t.text "about"
    t.string "company_name"
    t.string "scheduling_link"
    t.string "paypal_email"
    t.string "profile_url"
    t.string "slug"
    t.string "avatar"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
end
