class School < ApplicationRecord
  belongs_to :user, optional: true
  has_many :courses

  mount_uploader :image, ImageUploader
end
