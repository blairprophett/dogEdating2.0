class Park < ActiveRecord::Base
  has_many :dogs
  
  #geocoder gem- automatically fetch coordinates after validation
  #stored in latitude and longitude attributes
  geocoded_by :address
  after_validation :geocode
end
