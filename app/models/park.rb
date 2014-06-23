class Park < ActiveRecord::Base
  #geocoder gem- automatically fetch coordinates after validation
  #storea in latitude and longitude attributes
  geocoded_by :address
  after_validation :geocode
end
