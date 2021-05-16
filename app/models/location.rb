class Location < ApplicationRecord 
  before_save { self.location = location.upcase }
  belongs_to :location_type
  has_many :employee, dependent: :destroy
  validates :location, presence: true, 
                        length: {minimum: 2, maximum: 25} 
end