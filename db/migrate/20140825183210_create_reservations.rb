class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.belongs_to :table, null: false
      t.timestamps
    end
  end
end
