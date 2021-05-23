class EnterpriseAsset < ApplicationRecord 
  before_save { self.hostname = hostname.upcase }
  belongs_to :make_model 
  validates :hostname, presence: true, uniqueness: { case_sensitive: false},
                        length: {minimum: 2, maximum: 25} 
  validates :serial_number, presence: true, uniqueness: { case_sensitive: false},
                        length: {minimum: 3, maximum: 25}
  validates :asset_status, presence: true, length: {minimum: 2, maximum: 20} 
end