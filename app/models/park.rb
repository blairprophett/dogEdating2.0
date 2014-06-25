class Park < ActiveRecord::Base
  #join table on the park and dog models
  has_many :favorites
  has_many :dogs, through: :favorites
  
  #geocoder gem- automatically fetch coordinates after validation
  #stored in latitude and longitude attributes
  geocoded_by :address
  after_validation :geocode

  #ensures a park is unique before creating a new instance
  def self.ensure_from_yelp_data yelp_data
    self.find_or_create_by(yelp_data)
  end

end
