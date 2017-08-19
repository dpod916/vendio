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

ActiveRecord::Schema.define(version: 30190903160852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "attachments", id: :serial, force: :cascade do |t|
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.boolean "deleted"
    t.string "attachable_type"
    t.integer "attachable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "business_units", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "division_id"
    t.index ["division_id"], name: "index_business_units_on_division_id"
  end

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "comment_desc_idx"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "legal_name"
    t.float "lng"
    t.float "lat"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tax_id"
  end

  create_table "company_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "company_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "company_desc_idx"
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "function_id"
    t.index ["function_id"], name: "index_departments_on_function_id"
  end

  create_table "divisions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_profiles", id: :serial, force: :cascade do |t|
    t.string "business_partner_id"
    t.string "business_unit"
    t.string "company"
    t.string "compensation_eligible"
    t.string "cost_center"
    t.string "country_code"
    t.string "country_id"
    t.string "created_on"
    t.string "default_locale"
    t.string "department"
    t.string "distinguished_name"
    t.string "division"
    t.string "domain"
    t.string "email"
    t.string "employee_external_id"
    t.string "employee_guid"
    t.string "employee_id"
    t.string "employee_source_id"
    t.string "expiration"
    t.string "first_name"
    t.string "function"
    t.string "functional_manager_id"
    t.string "gender"
    t.string "global_employee_id"
    t.string "grade"
    t.string "hire_date"
    t.string "is_active"
    t.string "is_locked"
    t.string "is_manager"
    t.string "job_title"
    t.string "last_name"
    t.string "location"
    t.string "manager_id"
    t.string "manager_user_account_id"
    t.string "middle_name"
    t.string "notes_canonical_name"
    t.string "object_guid"
    t.string "performance_plan"
    t.string "preferred_name"
    t.string "preferred_name_normalized"
    t.string "primary_user_account_id"
    t.string "salary_ref_country_id"
    t.string "segment"
    t.string "source_system_id"
    t.string "status_id"
    t.string "timezone"
    t.string "title"
    t.string "updated_on"
    t.string "user_account_id"
    t.string "user_info"
    t.string "username"
    t.string "version"
    t.integer "old_user_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employee_profiles_on_user_id"
  end

  create_table "external_companies", id: :serial, force: :cascade do |t|
    t.string "company_name_id"
    t.string "name"
    t.string "short_name"
    t.string "url"
    t.string "year_founded"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.string "full_time_employees"
    t.string "company_type"
    t.string "company_category"
    t.string "revenue_source"
    t.string "business_model"
    t.string "social_impact"
    t.string "description"
    t.string "description_short"
    t.string "source_count"
    t.string "data_types"
    t.string "example_uses"
    t.string "data_impacts"
    t.string "financial_info"
    t.string "last_updated"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_company_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "external_company_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "external_company_desc_idx"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", id: :serial, force: :cascade do |t|
    t.string "issuable_type"
    t.integer "issuable_id"
    t.integer "priority_id"
    t.date "start_date"
    t.date "due_date"
    t.integer "severity_id"
    t.boolean "non_compliance"
    t.boolean "regulatory_impact"
    t.boolean "confidential"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_id"
    t.string "name"
    t.string "title"
    t.boolean "reviewable"
    t.index ["issuable_type", "issuable_id"], name: "index_issues_on_issuable_type_and_issuable_id"
    t.index ["priority_id"], name: "index_issues_on_priority_id"
    t.index ["severity_id"], name: "index_issues_on_severity_id"
    t.index ["status_id"], name: "index_issues_on_status_id"
  end

  create_table "job_titles", id: :serial, force: :cascade do |t|
    t.integer "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "department_id"
    t.index ["department_id"], name: "index_job_titles_on_department_id"
    t.index ["function_id"], name: "index_job_titles_on_function_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "matter_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "matter_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "matter_desc_idx"
  end

  create_table "matters", id: :serial, force: :cascade do |t|
    t.integer "status_id"
    t.integer "priority_id"
    t.date "start_date"
    t.date "due_date"
    t.string "matterable_type"
    t.integer "matterable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "name"
    t.string "title"
    t.boolean "reviewable"
    t.boolean "confidential"
    t.index ["matterable_type", "matterable_id"], name: "index_matters_on_matterable_type_and_matterable_id"
    t.index ["priority_id"], name: "index_matters_on_priority_id"
    t.index ["status_id"], name: "index_matters_on_status_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.string "key", null: false
    t.string "group_type"
    t.bigint "group_id"
    t.integer "group_owner_id"
    t.string "notifier_type"
    t.bigint "notifier_id"
    t.text "parameters"
    t.datetime "opened_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id"
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
  end

  create_table "offices", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "clean_name"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_offices_on_location_id"
  end

  create_table "operating_companies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "postable_type"
    t.integer "postable_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "priorities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "priority_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.string "profilable_type"
    t.integer "profilable_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "avatar_url"
    t.text "description"
    t.string "name"
    t.string "title"
    t.string "tag_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profilable_type", "profilable_id"], name: "index_profiles_on_profilable_type_and_profilable_id"
  end

  create_table "profit_centers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regulators", id: :serial, force: :cascade do |t|
    t.string "long_name"
    t.string "short_name"
    t.string "website"
    t.string "category"
    t.string "rulebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", id: :serial, force: :cascade do |t|
    t.datetime "sent_on"
    t.string "remindor_type"
    t.integer "remindor_id"
    t.string "remindee_type"
    t.integer "remindee_id"
    t.string "remindable_type"
    t.integer "remindable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remindable_type", "remindable_id"], name: "index_reminders_on_remindable_type_and_remindable_id"
    t.index ["remindee_type", "remindee_id"], name: "index_reminders_on_remindee_type_and_remindee_id"
    t.index ["remindor_type", "remindor_id"], name: "index_reminders_on_remindor_type_and_remindor_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "rule_books", id: :serial, force: :cascade do |t|
    t.integer "external_company_id"
    t.string "url"
    t.string "language"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_company_id"], name: "index_rule_books_on_external_company_id"
  end

  create_table "segments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "severities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "status_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "key", null: false
    t.boolean "subscribing", default: true, null: false
    t.boolean "subscribing_to_email", default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text "optional_targets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_subscriptions_on_key"
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "priority_id"
    t.date "start_date"
    t.date "due_date"
    t.string "type"
    t.string "taskable_type"
    t.integer "taskable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_id"
    t.string "name"
    t.string "title"
    t.boolean "reviewable"
    t.boolean "confidential"
    t.text "description"
    t.index ["priority_id"], name: "index_tasks_on_priority_id"
    t.index ["status_id"], name: "index_tasks_on_status_id"
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id"
  end

  create_table "todo_items", id: :serial, force: :cascade do |t|
    t.string "listable_type"
    t.integer "listable_id"
    t.integer "todo_list_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listable_type", "listable_id"], name: "index_todo_items_on_listable_type_and_listable_id"
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
  end

  create_table "todo_lists", id: :serial, force: :cascade do |t|
    t.string "owner_type"
    t.integer "owner_id"
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_todo_lists_on_owner_type_and_owner_id"
  end

  create_table "user_assignments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "assignable_type"
    t.integer "assignable_id"
    t.string "role"
    t.integer "assignor_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direction"
    t.index ["accepted"], name: "index_user_assignments_on_accepted"
    t.index ["assignable_type", "assignable_id"], name: "index_user_assignments_on_assignable_type_and_assignable_id"
    t.index ["assignor_id"], name: "index_user_assignments_on_assignor_id"
    t.index ["role"], name: "index_user_assignments_on_role"
    t.index ["user_id", "assignable_type", "assignable_id"], name: "index_user_assignments_on_user_and_assignable", unique: true
    t.index ["user_id"], name: "index_user_assignments_on_user_id"
  end

  create_table "user_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "user_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "user_desc_idx"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.integer "old_id"
    t.integer "parent_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "company_id"
    t.integer "profit_center_id"
    t.integer "office_id"
    t.integer "function_id"
    t.integer "segment_id"
    t.integer "business_unit_id"
    t.integer "department_id"
    t.integer "division_id"
    t.integer "manager_id"
    t.string "name"
    t.string "title"
    t.index ["business_unit_id"], name: "index_users_on_business_unit_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["division_id"], name: "index_users_on_division_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["function_id"], name: "index_users_on_function_id"
    t.index ["office_id"], name: "index_users_on_office_id"
    t.index ["old_id"], name: "index_users_on_old_id"
    t.index ["parent_id"], name: "index_users_on_parent_id"
    t.index ["profit_center_id"], name: "index_users_on_profit_center_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["segment_id"], name: "index_users_on_segment_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "attachments", "users"
  add_foreign_key "business_units", "divisions"
  add_foreign_key "comments", "users"
  add_foreign_key "departments", "functions"
  add_foreign_key "issues", "priorities"
  add_foreign_key "issues", "severities"
  add_foreign_key "issues", "statuses"
  add_foreign_key "job_titles", "departments"
  add_foreign_key "job_titles", "functions"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "matters", "priorities"
  add_foreign_key "matters", "statuses"
  add_foreign_key "offices", "locations"
  add_foreign_key "posts", "users"
  add_foreign_key "rule_books", "external_companies"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tasks", "priorities"
  add_foreign_key "tasks", "statuses"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "user_assignments", "users"
  add_foreign_key "users", "business_units"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "divisions"
  add_foreign_key "users", "functions"
  add_foreign_key "users", "offices"
  add_foreign_key "users", "profit_centers"
  add_foreign_key "users", "segments"
end
