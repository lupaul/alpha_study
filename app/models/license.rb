class License < ApplicationRecord
  belongs_to :category
  has_many :courses
  has_many :consultations
end
