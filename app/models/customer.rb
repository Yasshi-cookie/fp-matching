# frozen_string_literal: true

class Customer < ApplicationRecord
  has_secure_password validations: true

  validates :name, presence: true
  validates :email, presence: true, uniquness: true
end
