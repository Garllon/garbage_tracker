# frozen_string_literal: true

FactoryBot.define do
  factory :pile do
    kind { :bio }
    weight { 100 }
    produced_at { Date.today }

    association :user
    association :container
  end
end
