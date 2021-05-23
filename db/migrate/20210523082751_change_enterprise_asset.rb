class ChangeEnterpriseAsset < ActiveRecord::Migration[6.1]
  def change
    change_column :enterprise_assets, :warranty_start_date, :datetime 
    change_column :enterprise_assets, :warranty_end_date, :datetime
  end
end
