# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
  end
end