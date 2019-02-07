FactoryBot.define do
  factory :comment do
    comment { "MyString" }
    post_id { nil }
    user_id { nil }
  end
end
