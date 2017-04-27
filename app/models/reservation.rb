class Reservation < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :members, through: :appointments, source: :user
end
