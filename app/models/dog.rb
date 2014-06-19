class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :park

  mount_uploader :image, ImageUploader
end
