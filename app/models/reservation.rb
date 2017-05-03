class Reservation < ApplicationRecord
  belongs_to :school, class_name: :user, foreign_key: :user_id, optional: true
  mount_uploader :card_image, ImageUploader
  has_many :appointments
  has_many :members, through: :appointments, source: :user
  has_many :likes, as: :likeable

end
