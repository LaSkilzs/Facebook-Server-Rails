FactoryBot.define do

  factory :friend do
    name { "MyString" }
    location { "MyString" }
    mutual_friends { "" }
    user
  end
end
