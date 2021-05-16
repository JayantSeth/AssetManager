class EmployeeAsset < ApplicationRecord 
  belongs_to :employee 
  belongs_to :enterprise_asset 
end