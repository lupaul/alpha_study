class Page < ApplicationRecord
  belongs_to :school, class_name: 'User', foreign_key: 'user_id' 

  mount_uploader :main_image, ImageUploader
  mount_uploader :first_image, ImageUploader
  mount_uploader :second_image, ImageUploader
  mount_uploader :third_image, ImageUploader
end
