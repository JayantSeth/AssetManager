class AssetType < ApplicationRecord 
  before_save { self.asset_type = asset_type.upcase }
  validates :asset_type, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 25} 
end