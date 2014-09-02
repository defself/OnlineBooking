FactoryGirl.define do
  factory :table do
    sequence(:number) { |n| n }
    restaurant
  end
end
