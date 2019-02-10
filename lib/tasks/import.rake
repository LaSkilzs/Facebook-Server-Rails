require 'csv'
require 'byebug'


namespace :import do

  desc "Import users from csv"
  task users: :environment do
    filename = File.join Rails.root, 'db/csv/users.csv'

    CSV.foreach(filename, headers: true) do |row|
        User.create(username: row['username'], password: row['password'], email: row['email'])
      end
  end

  desc "Import profiles from csv"
  task profiles: :environment do
    filename = File.join Rails.root, 'db/csv/profiles.csv'

    CSV.foreach(filename, headers: true) do |row|
      Profile.create(name: row['name'], address: row['address'], birthday: row['birthday'], phone: row['phone'], location: row['location'], movie: row['movie'], animal: row['animal'], sport: row['sport'], interests: row['interests'], user_id: row['user_id'])
    end
  end

  desc "Import profilephotos from csv"
  task profilephotos: :environment do
    filename = File.join, Rails.root, 'db/csv/profilephotos.csv'
    filename = (filename[1].to_s) + '/'+ (filename[2])

    CSV.foreach(filename, headers: true) do |row|
      ProfilePhoto.create(user_id: row['user_id'], profile_id: row['profile_id'])
    end
  end

  desc "Import posts from csv"
  task posts: :environment do
    filename = File.join, Rails.root, 'db/csv/posts.csv'
    filename = (filename[1].to_s) + '/'+ (filename[2])

    CSV.foreach(filename, headers: true) do |row|
      Post.create(post: row['post'], user_id: row['user_id'])
    end
  end

  desc "Import photos from csv"
  task photos: :environment do 
    filename = File.join, Rails.root, 'db/csv/photos.csv'
    filename = (filename[1].to_s) + '/'+ (filename[2])
   
    CSV.foreach(filename, headers: true) do |row|
      Photo.create(name: row['name'], image: row['image'], details: row['details'], user_id: row['user_id'])
    end
  end

  desc "Import liked_posts from csv"
  task likedposts: :environment do
    filename = File.join, Rails.root, 'db/csv/likedposts.csv'
    filename = (filename[1].to_s) + '/'+ (filename[2])

    CSV.foreach(filename, headers: true) do |row|
      LikedPost.create(user_id: row['user_id'], post_id: row['post_id'])
    end
   end

  desc "Import like_comments from csv"
  task likecomments: :environment do 
    filename = File.join Rails.root,'db/csv/likecomments.csv'
    CSV.foreach(filename, headers: true) do |row|
      LikeComment.create(user_id: row['user_id'], post_id: row['post_id'])
    end
  end

  desc "Import comments from csv"
  task comments: :environment do
    filename = File.join Rails.root, 'db/csv/comments.csv'

    CSV.foreach(filename, headers: true) do |row|
      Comment.create(comment: row['comment'], post_id: row['post_id'], user_id: row['user_id'])
    end
  end

end