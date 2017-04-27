class Activity < ApplicationRecord
  belongs_to :school, class_name: :user, foreign_key: :user_id, optional: true
  belongs_to :user
  has_many :participations
  has_many :members, through: :participations, source: :user
  mount_uploader :image, ImageUploader
end
