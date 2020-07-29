# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'Example User' }
    sequence(:email) { |n| "customer_#{n}@example.com" }
  end
end
