class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :park

  #for CarrierWave image uploader
  mount_uploader :image, ImageUploader
end
