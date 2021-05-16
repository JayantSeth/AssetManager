class Department < ApplicationRecord 
  before_save { self.department = department.upcase }
  has_many :employee, dependent: :destroy
  validates :department, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 2, maximum: 25} 
end