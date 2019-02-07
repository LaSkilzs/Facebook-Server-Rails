FactoryBot.define do
  factory :like_comment do
    comment { "MyString" }
    post_id { nil }
    user_id { nil }
  end
end
