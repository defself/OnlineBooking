FactoryGirl.define do
  factory :reservation do
    table
    # sequence(:start_time) { |n| (Time.now + n.hours).beginning_of_hour }
    # sequence(:end_time)   { |n| (Time.now + n.hours).beginning_of_hour }
    start_time Time.now
    end_time Time.now + 1.hour
  end
end
