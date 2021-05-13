class CreateLocationTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :location_types do |t|
      t.string :location_type 
      t.string :comment
      t.timestamps
    end
  end
end
