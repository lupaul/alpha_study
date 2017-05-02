class Activity < ApplicationRecord
  belongs_to :school, class_name: :user, foreign_key: :user_id, optional: true
  has_many :participations
  has_many :students, through: :participations, source: :user
  mount_uploader :card_image, ImageUploader
  mount_uploader :banner_image, ImageUploader
  has_many :members, through: :participations, source: :user
  
end
