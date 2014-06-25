class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :parks, through: :favorites

  # validates :name, presence: true, length: { minimum: 2 }
  # validates :age, presence: true, length: { minimum: 2 }

  #readys model for CarrierWave image uploader
  mount_uploader :image, ImageUploader

end

# t.string   "name"
#     t.string   "breed"
#     t.string   "age"
#     t.string   "image"
#     t.integer  "user_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"