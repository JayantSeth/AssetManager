class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :location 
      t.integer :location_type_id
      t.string :comment 
      t.timestamps
    end
  end
end
