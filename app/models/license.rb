class License < ApplicationRecord
  has_many :courses
  has_many :consultations
end
