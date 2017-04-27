class Expert < ApplicationRecord
  belongs_to :course
  mount_uploader :avatar_image, ImageUploader
  mount_uploader :card_image, ImageUploader
  mount_uploader :banner_image, ImageUploader
end
