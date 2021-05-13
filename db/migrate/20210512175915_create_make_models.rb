class CreateMakeModels < ActiveRecord::Migration[6.1]
  def change
    create_table :make_models do |t|
      t.string :make 
      t.string :model 
      t.string :comment 
      t.integer :asset_type_id
      t.timestamps
    end
  end
end
