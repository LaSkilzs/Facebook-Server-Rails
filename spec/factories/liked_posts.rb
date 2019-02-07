FactoryBot.define do
  factory :liked_post do
    likes { "" }
    user_id { nil }
    post_id { nil }
  end
end
