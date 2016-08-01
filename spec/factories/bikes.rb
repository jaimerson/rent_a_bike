FactoryGirl.define do
  factory :bike do
    sequence(:name) { |n| "Cool name #{n}"}
    model 0
    price 12.34
  end
end
