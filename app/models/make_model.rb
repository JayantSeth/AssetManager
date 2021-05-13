class MakeModel < ApplicationRecord 
  before_save { self.make = make.upcase }
  belongs_to :asset_type
  validates :make, presence: true, 
                        length: {minimum: 2, maximum: 25} 
  validates :model, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 2, maximum: 25}
end