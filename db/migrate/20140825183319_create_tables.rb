class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number, null: false
      t.belongs_to :restaurant, null: false
      t.timestamps
    end
  end
end
