FactoryGirl.define do
  factory :bike do
    sequence(:name) { |n| "Cool name #{n}"}
    model { Bike.models.values.sample }
    price 12.34
  end
end
