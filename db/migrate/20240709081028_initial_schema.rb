class InitialSchema < ActiveRecord::Migration[7.1]
  def change
    create_table "sessions", force: :cascade do |t|
      t.integer "user_id", null: false
      t.string "token", null: false
      t.string "ip_address"
      t.string "user_agent"
      t.datetime "last_active_at", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "token" ], name: "index_sessions_on_token", unique: true
      t.index [ "user_id" ], name: "index_sessions_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "name", null: false
      t.string "email_address", null: false
      t.string "username", null: false
      t.string "password_digest", null: false
      t.integer "role", null: false, default: 0
      t.boolean "active", default: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "email_address" ], name: "index_users_on_email_address", unique: true
      t.index [ "username" ], name: "index_users_on_username", unique: true
    end

    create_table "boards", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.string "appname", null: false
      t.string "description"
      t.string "company"
      t.string "website"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "user_id" ], name: "index_boards_on_user_id"
      t.index [ "appname" ], name: "index_boards_on_appname"
    end

    create_table "features", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.bigint "board_id", null: false
      t.integer "identity", null: false
      t.string "title"
      t.string "content"
      t.integer "label", null: false, default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "board_id" ], name: "index_features_on_board_id"
      t.index [ "user_id", "board_id" ], name: "index_features_on_user_id_and_board_id", unique: true
      t.index [ "board_id", "identity" ], name: "index_features_on_board_id_and_user_id", unique: true
      t.index [ "user_id" ], name: "index_features_on_user_id"
    end

    create_table "votes", force: :cascade do |t|
      t.bigint "feature_id", null: false
      t.bigint "user_id", null: false
      t.integer "value", null: false, default: 1 # Default value is 1 for an upvote
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "feature_id" ], name: "index_votes_on_feature_id"
      t.index [ "user_id" ], name: "index_votes_on_user_id"
      t.index [ "user_id", "feature_id" ], name: "index_votes_on_user_id_and_feature_id", unique: true
    end

    create_table "comments", force: :cascade do |t|
      t.bigint "feature_id", null: false
      t.bigint "user_id", null: false
      t.text "content", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index [ "feature_id" ], name: "index_comments_on_feature_id"
      t.index [ "user_id" ], name: "index_comments_on_user_id"
    end

    add_foreign_key "sessions", "users"
    add_foreign_key "boards", "users"
    add_foreign_key "features", "boards"
    add_foreign_key "features", "users"
    add_foreign_key "votes", "features"
    add_foreign_key "votes", "users"
    add_foreign_key "comments", "features"
    add_foreign_key "comments", "users"
  end
end
