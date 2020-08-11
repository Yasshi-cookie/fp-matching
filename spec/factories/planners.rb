# frozen_string_literal: true

FactoryBot.define do
  factory :planner do
    name { 'Example User' }
    sequence(:email) { |n| "planner_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
