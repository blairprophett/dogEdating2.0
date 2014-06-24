class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :dog_parks
  has_many :dog_parks, through: :parks

  #for CarrierWave image uploader
  mount_uploader :image, ImageUploader
end
