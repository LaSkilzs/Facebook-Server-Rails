FactoryBot.define do
  factory :friend do
    name { "MyString" }
    location { "MyString" }
    mutual_friends { "" }
    user_id { nil }
  end
end
