FactoryBot.define do
  factory :comment do
    body { FFaker::Internet.user_name }
    task
  end
end
