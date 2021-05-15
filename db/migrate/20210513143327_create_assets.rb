class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :hostname 
      t.string :serial_number 
      t.integer :make_model_id 
      t.string :warranty_start_date 
      t.string :warranty_end_date 
      t.boolean :is_instrument_machine, default: false 
      t.string :asset_status 
      t.string :comment
      t.timestamps
    end
  end
end
