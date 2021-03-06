require 'faker'

FactoryBot.define do
  factory :trip do
    association :weather, factory: :weather
    association :user, factory: :user
    association :city, factory: :city
    note { Faker::Lorem.paragraph_by_chars(500, false) }
  end
end
