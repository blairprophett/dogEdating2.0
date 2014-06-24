class Park < ActiveRecord::Base
  has_many :dog_parks
  has_many :dogs, through: :dog_parks
  
  #geocoder gem- automatically fetch coordinates after validation
  #stored in latitude and longitude attributes
  geocoded_by :address
  after_validation :geocode
end
