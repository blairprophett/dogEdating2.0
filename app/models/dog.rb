class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :parks, through: :favorites

  # validates :name, presence: true, length: { minimum: 2 }
  # validates :age, presence: true, length: { minimum: 2 }

  #readys model for CarrierWave image uploader
  mount_uploader :image, ImageUploader

end