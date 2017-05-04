class Reservation < ApplicationRecord
  mount_uploader :card_image, ImageUploader
  belongs_to :school, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :appointments
  has_many :members, through: :appointments, source: :user
  has_many :likes, as: :likeable

end
