class CreateEmployeeAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_assets do |t|
      t.integer :employee_id 
      t.integer :asset_id 
      t.string :comment
      t.timestamps
    end
  end
end
