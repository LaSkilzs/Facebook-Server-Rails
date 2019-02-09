ActiveRecord::Schema.define(version: 2019_02_07_194632) do

 
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "mutual_friends"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "like_comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_like_comments_on_post_id"
    t.index ["user_id"], name: "index_like_comments_on_user_id"
  end

  create_table "liked_posts", force: :cascade do |t|
    t.integer "likes"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_liked_posts_on_post_id"
    t.index ["user_id"], name: "index_liked_posts_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "post"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "movie"
    t.string "animal"
    t.string "sport"
    t.string "interests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "like_comments", "posts"
  add_foreign_key "like_comments", "users"
  add_foreign_key "liked_posts", "posts"
  add_foreign_key "liked_posts", "users"
  add_foreign_key "posts", "users"
end
