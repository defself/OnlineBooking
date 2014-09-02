FactoryGirl.define do
  factory :reservation do
    sequence(:start_time) { |n| (Time.now + n.hours).beginning_of_hour }
    sequence(:end_time)   { |n| (Time.now + n.hours).beginning_of_hour }
    table
  end
end
