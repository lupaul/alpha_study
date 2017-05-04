class School < ApplicationRecord
  belongs_to :user, optional: true
  has_many :courses
  mount_uploader :image, ImageUploader
  has_many :course
  has_many :consultations
  has_many :likes, as: :likeable

end
