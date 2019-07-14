require 'faker'

FactoryBot.define do
  factory :weather do
    temperature { Faker::Number.number(3) }
  end
end
