class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :description
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
