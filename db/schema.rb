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

ActiveRecord::Schema.define(version: 0) do

  create_table "mantis_api_token_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "name", limit: 128, null: false
    t.string "hash", limit: 128, null: false
    t.integer "date_created", default: 1, null: false, unsigned: true
    t.integer "date_used", default: 1, null: false, unsigned: true
    t.index ["user_id", "name"], name: "idx_user_id_name", unique: true
  end

  create_table "mantis_bug_file_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.string "title", limit: 250, default: "", null: false
    t.string "description", limit: 250, default: "", null: false
    t.string "diskfile", limit: 250, default: "", null: false
    t.string "filename", limit: 250, default: "", null: false
    t.string "folder", limit: 250, default: "", null: false
    t.integer "filesize", default: 0, null: false
    t.string "file_type", limit: 250, default: "", null: false
    t.binary "content", limit: 4294967295
    t.integer "date_added", default: 1, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_bug_file_bug_id"
    t.index ["diskfile"], name: "idx_diskfile"
  end

  create_table "mantis_bug_history_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.string "field_name", limit: 64, null: false
    t.string "old_value", null: false
    t.string "new_value", null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.integer "date_modified", default: 1, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_bug_history_bug_id"
    t.index ["date_modified"], name: "idx_bug_history_date_modified"
    t.index ["user_id"], name: "idx_history_user_id"
  end

  create_table "mantis_bug_monitor_table", primary_key: ["user_id", "bug_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_bug_id"
  end

  create_table "mantis_bug_relationship_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "source_bug_id", default: 0, null: false, unsigned: true
    t.integer "destination_bug_id", default: 0, null: false, unsigned: true
    t.integer "relationship_type", limit: 2, default: 0, null: false
    t.index ["destination_bug_id"], name: "idx_relationship_destination"
    t.index ["source_bug_id"], name: "idx_relationship_source"
  end

  create_table "mantis_bug_revision_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bug_id", null: false, unsigned: true
    t.integer "bugnote_id", default: 0, null: false, unsigned: true
    t.integer "user_id", null: false, unsigned: true
    t.integer "type", null: false, unsigned: true
    t.text "value", limit: 4294967295, null: false
    t.integer "timestamp", default: 1, null: false, unsigned: true
    t.index ["bug_id", "timestamp"], name: "idx_bug_rev_id_time"
    t.index ["type"], name: "idx_bug_rev_type"
  end

  create_table "mantis_bug_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "reporter_id", default: 0, null: false, unsigned: true
    t.integer "handler_id", default: 0, null: false, unsigned: true
    t.integer "duplicate_id", default: 0, null: false, unsigned: true
    t.integer "priority", limit: 2, default: 30, null: false
    t.integer "severity", limit: 2, default: 50, null: false
    t.integer "reproducibility", limit: 2, default: 10, null: false
    t.integer "status", limit: 2, default: 10, null: false
    t.integer "resolution", limit: 2, default: 10, null: false
    t.integer "projection", limit: 2, default: 10, null: false
    t.integer "eta", limit: 2, default: 10, null: false
    t.integer "bug_text_id", default: 0, null: false, unsigned: true
    t.string "os", limit: 32, default: "", null: false
    t.string "os_build", limit: 32, default: "", null: false
    t.string "platform", limit: 32, default: "", null: false
    t.string "version", limit: 64, default: "", null: false
    t.string "fixed_in_version", limit: 64, default: "", null: false
    t.string "build", limit: 32, default: "", null: false
    t.integer "profile_id", default: 0, null: false, unsigned: true
    t.integer "view_state", limit: 2, default: 10, null: false
    t.string "summary", limit: 128, default: "", null: false
    t.integer "sponsorship_total", default: 0, null: false
    t.integer "sticky", limit: 1, default: 0, null: false
    t.string "target_version", limit: 64, default: "", null: false
    t.integer "category_id", default: 1, null: false, unsigned: true
    t.integer "date_submitted", default: 1, null: false, unsigned: true
    t.integer "due_date", default: 1, null: false, unsigned: true
    t.integer "last_updated", default: 1, null: false, unsigned: true
    t.index ["fixed_in_version"], name: "idx_bug_fixed_in_version"
    t.index ["project_id"], name: "idx_project"
    t.index ["sponsorship_total"], name: "idx_bug_sponsorship_total"
    t.index ["status"], name: "idx_bug_status"
  end

  create_table "mantis_bug_tag_table", primary_key: ["bug_id", "tag_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.integer "tag_id", default: 0, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "date_attached", default: 1, null: false, unsigned: true
    t.index ["tag_id"], name: "idx_bug_tag_tag_id"
  end

  create_table "mantis_bug_text_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "description", limit: 4294967295, null: false
    t.text "steps_to_reproduce", limit: 4294967295, null: false
    t.text "additional_information", limit: 4294967295, null: false
  end

  create_table "mantis_bugnote_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.integer "reporter_id", default: 0, null: false, unsigned: true
    t.integer "bugnote_text_id", default: 0, null: false, unsigned: true
    t.integer "view_state", limit: 2, default: 10, null: false
    t.integer "note_type", default: 0
    t.string "note_attr", limit: 250, default: ""
    t.integer "time_tracking", default: 0, null: false, unsigned: true
    t.integer "last_modified", default: 1, null: false, unsigned: true
    t.integer "date_submitted", default: 1, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_bug"
    t.index ["last_modified"], name: "idx_last_mod"
  end

  create_table "mantis_bugnote_text_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "note", limit: 4294967295, null: false
  end

  create_table "mantis_category_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "name", limit: 128, default: "", null: false
    t.integer "status", default: 0, null: false, unsigned: true
    t.index ["project_id", "name"], name: "idx_category_project_name", unique: true
  end

  create_table "mantis_config_table", primary_key: ["config_id", "project_id", "user_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "config_id", limit: 64, null: false
    t.integer "project_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.integer "access_reqd", default: 0
    t.integer "type", default: 90
    t.text "value", limit: 4294967295, null: false
  end

  create_table "mantis_custom_field_project_table", primary_key: ["field_id", "project_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "field_id", default: 0, null: false
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "sequence", limit: 2, default: 0, null: false
  end

  create_table "mantis_custom_field_string_table", primary_key: ["field_id", "bug_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "field_id", default: 0, null: false
    t.integer "bug_id", default: 0, null: false
    t.string "value", default: "", null: false
    t.text "text", limit: 4294967295
    t.index ["bug_id"], name: "idx_custom_field_bug"
  end

  create_table "mantis_custom_field_table", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 64, default: "", null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.text "possible_values"
    t.string "default_value", default: "", null: false
    t.string "valid_regexp", default: "", null: false
    t.integer "access_level_r", limit: 2, default: 0, null: false
    t.integer "access_level_rw", limit: 2, default: 0, null: false
    t.integer "length_min", default: 0, null: false
    t.integer "length_max", default: 0, null: false
    t.integer "require_report", limit: 1, default: 0, null: false
    t.integer "require_update", limit: 1, default: 0, null: false
    t.integer "display_report", limit: 1, default: 0, null: false
    t.integer "display_update", limit: 1, default: 1, null: false
    t.integer "require_resolved", limit: 1, default: 0, null: false
    t.integer "display_resolved", limit: 1, default: 0, null: false
    t.integer "display_closed", limit: 1, default: 0, null: false
    t.integer "require_closed", limit: 1, default: 0, null: false
    t.integer "filter_by", limit: 1, default: 1, null: false
    t.index ["name"], name: "idx_custom_field_name"
  end

  create_table "mantis_email_table", primary_key: "email_id", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", limit: 64, default: "", null: false
    t.string "subject", limit: 250, default: "", null: false
    t.text "metadata", limit: 4294967295, null: false
    t.text "body", limit: 4294967295, null: false
    t.integer "submitted", default: 1, null: false, unsigned: true
  end

  create_table "mantis_filters_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.integer "project_id", default: 0, null: false
    t.integer "is_public", limit: 1
    t.string "name", limit: 64, default: "", null: false
    t.text "filter_string", limit: 4294967295, null: false
  end

  create_table "mantis_news_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "poster_id", default: 0, null: false, unsigned: true
    t.integer "view_state", limit: 2, default: 10, null: false
    t.integer "announcement", limit: 1, default: 0, null: false
    t.string "headline", limit: 64, default: "", null: false
    t.text "body", limit: 4294967295, null: false
    t.integer "last_modified", default: 1, null: false, unsigned: true
    t.integer "date_posted", default: 1, null: false, unsigned: true
  end

  create_table "mantis_plugin_EmailReporting_msgids_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "issue_id", null: false, unsigned: true
    t.string "msg_id", null: false
    t.index ["msg_id"], name: "idx_erp_msgids_msgid", unique: true
  end

  create_table "mantis_plugin_table", primary_key: "basename", id: :string, limit: 40, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "enabled", limit: 1, default: 0, null: false
    t.integer "protected", limit: 1, default: 0, null: false
    t.integer "priority", default: 3, null: false, unsigned: true
  end

  create_table "mantis_project_file_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.string "title", limit: 250, default: "", null: false
    t.string "description", limit: 250, default: "", null: false
    t.string "diskfile", limit: 250, default: "", null: false
    t.string "filename", limit: 250, default: "", null: false
    t.string "folder", limit: 250, default: "", null: false
    t.integer "filesize", default: 0, null: false
    t.string "file_type", limit: 250, default: "", null: false
    t.binary "content", limit: 4294967295
    t.integer "date_added", default: 1, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
  end

  create_table "mantis_project_hierarchy_table", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "child_id", null: false, unsigned: true
    t.integer "parent_id", null: false, unsigned: true
    t.integer "inherit_parent", limit: 1, default: 0, null: false
    t.index ["child_id", "parent_id"], name: "idx_project_hierarchy", unique: true
    t.index ["child_id"], name: "idx_project_hierarchy_child_id"
    t.index ["parent_id"], name: "idx_project_hierarchy_parent_id"
  end

  create_table "mantis_project_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 128, default: "", null: false
    t.integer "status", limit: 2, default: 10, null: false
    t.integer "enabled", limit: 1, default: 1, null: false
    t.integer "view_state", limit: 2, default: 10, null: false
    t.integer "access_min", limit: 2, default: 10, null: false
    t.string "file_path", limit: 250, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "category_id", default: 1, null: false, unsigned: true
    t.integer "inherit_global", limit: 1, default: 0, null: false
    t.index ["name"], name: "idx_project_name", unique: true
    t.index ["view_state"], name: "idx_project_view"
  end

  create_table "mantis_project_user_list_table", primary_key: ["project_id", "user_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "access_level", limit: 2, default: 10, null: false
    t.index ["user_id"], name: "idx_project_user"
  end

  create_table "mantis_project_version_table", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.string "version", limit: 64, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "released", limit: 1, default: 1, null: false
    t.integer "obsolete", limit: 1, default: 0, null: false
    t.integer "date_order", default: 1, null: false, unsigned: true
    t.index ["project_id", "version"], name: "idx_project_version", unique: true
  end

  create_table "mantis_sponsorship_table", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bug_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.integer "amount", default: 0, null: false
    t.string "logo", limit: 128, default: "", null: false
    t.string "url", limit: 128, default: "", null: false
    t.integer "paid", limit: 1, default: 0, null: false
    t.integer "date_submitted", default: 1, null: false, unsigned: true
    t.integer "last_updated", default: 1, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_sponsorship_bug_id"
    t.index ["user_id"], name: "idx_sponsorship_user_id"
  end

  create_table "mantis_tag_table", primary_key: ["id", "name"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id", null: false, unsigned: true, auto_increment: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "name", limit: 100, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "date_created", default: 1, null: false, unsigned: true
    t.integer "date_updated", default: 1, null: false, unsigned: true
    t.index ["name"], name: "idx_tag_name"
  end

  create_table "mantis_tokens_table", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "owner", null: false
    t.integer "type", null: false
    t.text "value", limit: 4294967295, null: false
    t.integer "timestamp", default: 1, null: false, unsigned: true
    t.integer "expiry", default: 1, null: false, unsigned: true
    t.index ["type", "owner"], name: "idx_typeowner"
  end

  create_table "mantis_user_pref_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "default_profile", default: 0, null: false, unsigned: true
    t.integer "default_project", default: 0, null: false, unsigned: true
    t.integer "refresh_delay", default: 0, null: false
    t.integer "redirect_delay", default: 0, null: false
    t.string "bugnote_order", limit: 4, default: "ASC", null: false
    t.integer "email_on_new", limit: 1, default: 0, null: false
    t.integer "email_on_assigned", limit: 1, default: 0, null: false
    t.integer "email_on_feedback", limit: 1, default: 0, null: false
    t.integer "email_on_resolved", limit: 1, default: 0, null: false
    t.integer "email_on_closed", limit: 1, default: 0, null: false
    t.integer "email_on_reopened", limit: 1, default: 0, null: false
    t.integer "email_on_bugnote", limit: 1, default: 0, null: false
    t.integer "email_on_status", limit: 1, default: 0, null: false
    t.integer "email_on_priority", limit: 1, default: 0, null: false
    t.integer "email_on_priority_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_status_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_bugnote_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_reopened_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_closed_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_resolved_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_feedback_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_assigned_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_new_min_severity", limit: 2, default: 10, null: false
    t.integer "email_bugnote_limit", limit: 2, default: 0, null: false
    t.string "language", limit: 32, default: "english", null: false
    t.string "timezone", limit: 32, default: "", null: false
  end

  create_table "mantis_user_print_pref_table", primary_key: "user_id", id: :integer, default: 0, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "print_pref", limit: 64, null: false
  end

  create_table "mantis_user_profile_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "platform", limit: 32, default: "", null: false
    t.string "os", limit: 32, default: "", null: false
    t.string "os_build", limit: 32, default: "", null: false
    t.text "description", limit: 4294967295, null: false
  end

  create_table "mantis_user_table", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", limit: 191, default: "", null: false
    t.string "realname", limit: 191, default: "", null: false
    t.string "email", limit: 191, default: "", null: false
    t.string "password", limit: 64, default: "", null: false
    t.integer "enabled", limit: 1, default: 1, null: false
    t.integer "protected", limit: 1, default: 0, null: false
    t.integer "access_level", limit: 2, default: 10, null: false
    t.integer "login_count", default: 0, null: false
    t.integer "lost_password_request_count", limit: 2, default: 0, null: false
    t.integer "failed_login_count", limit: 2, default: 0, null: false
    t.string "cookie_string", limit: 64, default: "", null: false
    t.integer "last_visit", default: 1, null: false, unsigned: true
    t.integer "date_created", default: 1, null: false, unsigned: true
    t.index ["access_level"], name: "idx_access"
    t.index ["cookie_string"], name: "idx_user_cookie_string", unique: true
    t.index ["email"], name: "idx_email"
    t.index ["enabled"], name: "idx_enable"
    t.index ["username"], name: "idx_user_username", unique: true
  end

end
