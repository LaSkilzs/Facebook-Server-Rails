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

ActiveRecord::Schema.define(version: 2019_02_13_185145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "friend"
    t.integer "mutual_friends"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "friend"
    t.integer "mutual_friends"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "like_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "comment_id"
    t.index ["comment_id"], name: "index_like_comments_on_comment_id"
    t.index ["user_id"], name: "index_like_comments_on_user_id"
  end

  create_table "liked_posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_liked_posts_on_post_id"
    t.index ["user_id"], name: "index_liked_posts_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "post"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
    t.string "text"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profile_photos", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "photo_id"
    t.index ["photo_id"], name: "index_profile_photos_on_photo_id"
    t.index ["profile_id"], name: "index_profile_photos_on_profile_id"
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
    t.string "address"
    t.date "birthday"
    t.string "phone"
    t.bigint "user_id"
    t.string "image1"
    t.string "image2"
    t.integer "friends"
    t.integer "followers"
    t.index ["user_id"], name: "index_profiles_on_user_id"
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
  add_foreign_key "followers", "followers"
  add_foreign_key "followers", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "like_comments", "users"
  add_foreign_key "liked_posts", "posts"
  add_foreign_key "liked_posts", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "profile_photos", "profiles"
end
