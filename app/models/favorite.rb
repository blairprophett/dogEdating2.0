class Favorite < ActiveRecord::Base
  belongs_to :dog
  belongs_to :park

  def self.ensure_favorite_from_park_data(park_data)
    find_or_create_by(park_data)
  end
end
