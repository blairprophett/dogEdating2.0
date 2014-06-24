class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :parks

  #for CarrierWave image uploader
  mount_uploader :image, ImageUploader
end
