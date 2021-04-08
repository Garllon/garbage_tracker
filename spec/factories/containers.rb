# frozen_string_literal: true

FactoryBot.define do
  factory :container do
    sequence(:name)
    weight { 100 }

    association :user
  end
end
