class Reservation < ApplicationRecord
  belongs_to :school, class_name: :user, foreign_key: :user_id, optional: true
  mount_uploader :card_image, ImageUploader
end