class CreateReservableTables < ActiveRecord::Migration[6.0]
  def change
    create_table :reservable_tables do |t|
      t.integer :planner_id, null: false
      t.integer :time_table_id, null: false
      t.date :date, null: false

      t.timestamps
      t.index %i[planner_id time_table_id date], unique: true
    end
  end
end
