FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}"}
    sequence(:email) { |n| "user_#{n}@example.org" }
  end
end
