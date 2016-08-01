FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User #{n}"}
    sequence(:email) { |n| "user_#{n}@example.org" }
  end
end
