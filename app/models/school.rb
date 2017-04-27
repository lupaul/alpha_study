class School < ApplicationRecord
  belongs_to :user, optional: true
  has_many :course
  has_many :consultations
end
