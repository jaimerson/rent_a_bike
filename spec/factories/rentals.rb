FactoryGirl.define do
  factory :rental do
    user
    bike
    created_at { 1.day.ago }
    returned_at { Date.today }
  end
end
