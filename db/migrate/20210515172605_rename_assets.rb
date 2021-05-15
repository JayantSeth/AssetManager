class RenameAssets < ActiveRecord::Migration[6.1]
  def change
    rename_table :assets, :enterprise_assets
  end
end
