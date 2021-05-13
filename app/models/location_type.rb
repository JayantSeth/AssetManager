class LocationType < ApplicationRecord 
  before_save { self.location_type = location_type.upcase }
  validates :location_type, presence: true, uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 25} 
end