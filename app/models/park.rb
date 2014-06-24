class Park < ActiveRecord::Base
  has_many :favorites
  has_many :dogs, through: :favorites
  
  #geocoder gem- automatically fetch coordinates after validation
  #stored in latitude and longitude attributes
  geocoded_by :address
  after_validation :geocode


  def self.ensure_from_yelp_data yelp_data
    self.find_or_create_by(yelp_data)
  end

end
