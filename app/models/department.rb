class Department < ApplicationRecord 
  before_save { self.department = department.upcase }
  validates :department, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 2, maximum: 25} 
end