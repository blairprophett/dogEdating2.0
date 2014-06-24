class Favorite < ActiveRecord::Base
  belongs_to :dog
  belongs_to :park
end
