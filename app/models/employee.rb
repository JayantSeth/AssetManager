class Employee < ApplicationRecord 
  belongs_to :location 
  belongs_to :department
  has_many :employee_assets, dependent: :destroy 
  has_many :enterprise_assets, through: :employee_assets
  validates :emp_name, presence: true, length: {minimum: 3, maximum: 25} 
  validates :emp_code, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 10} 
end