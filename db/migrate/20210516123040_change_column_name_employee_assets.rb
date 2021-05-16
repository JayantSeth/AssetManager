class ChangeColumnNameEmployeeAssets < ActiveRecord::Migration[6.1]
  def change
    rename_column :employee_assets, :asset_id, :enterprise_asset_id
  end
end
