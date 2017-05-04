class Expert < ApplicationRecord
  belongs_to :course
  has_many :likes, as: :likeable
  mount_uploader :avatar_image, ImageUploader
  mount_uploader :card_image, ImageUploader
  mount_uploader :banner_image, ImageUploader
end
