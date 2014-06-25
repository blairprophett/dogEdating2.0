class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :parks, through: :favorites

  #readys model for CarrierWave image uploader
  mount_uploader :image, ImageUploader

end
