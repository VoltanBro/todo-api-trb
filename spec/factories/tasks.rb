FactoryBot.define do
  factory :task do
    name { FFaker::Internet.user_name }
    due_date { Time.zone.now + rand(1..5).day }
    project
  end
end
