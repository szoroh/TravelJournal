require 'faker'

FactoryBot.define do
  factory :trip do
    association :user, factory: :user
    note { Faker::Lorem.paragraph_by_chars(500, false) }
  end
end
