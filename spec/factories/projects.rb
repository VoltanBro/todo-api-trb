FactoryBot.define do
  factory :project do
    title { FFaker::Movie.title }
    user
  end
end
