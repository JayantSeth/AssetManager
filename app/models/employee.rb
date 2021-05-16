class Employee < ApplicationRecord 
  validates :emp_name, presence: true, length: {minimum: 3, maximum: 25} 
  validates :emp_code, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 10} 
end