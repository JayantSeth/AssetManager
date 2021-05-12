class CreateAssetTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :asset_types do |t|
      t.string :asset_type
      t.string :comment
      t.timestamps
    end
  end
end
