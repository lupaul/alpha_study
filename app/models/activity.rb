class Activity < ApplicationRecord
  belongs_to :school, class_name: :user, foreign_key: :user_id, optional: true
  belongs_to :user
  has_many :participations
end
