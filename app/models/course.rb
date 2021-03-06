class Course < ApplicationRecord
  belongs_to :school
  belongs_to :license
  has_many :experts
  has_many :likes, as: :likeable
  mount_uploader :card_image, ImageUploader
  mount_uploader :banner_image, ImageUploader
end
