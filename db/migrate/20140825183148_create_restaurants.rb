class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :tables do |t|
      t.integer :number, null: false
      t.belongs_to :restaurant, null: false
      t.timestamps
    end

    create_table :reservations do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.belongs_to :table, null: false
      t.timestamps
    end
  end
end
