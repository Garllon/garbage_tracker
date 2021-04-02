# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "rspec-#{n.to_s.rjust(3, '0')}@example.com" }
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
