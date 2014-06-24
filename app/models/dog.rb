class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :parks

  #for CarrierWave image uploader
  mount_uploader :image, ImageUploader
end
