class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :reservable_table, null: false, foreign_key: true

      t.timestamps
      t.index %i[customer_id reservable_table_id], unique: true
    end
  end
end
