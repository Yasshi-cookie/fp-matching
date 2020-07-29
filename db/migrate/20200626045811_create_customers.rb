# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string 'name', limit: 50, null: false
      t.string 'email', limit: 255, null: false
      t.string 'password_digest', null: false

      t.timestamps precision: 6, null: false
    end
  end
end
