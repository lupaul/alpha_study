class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :reservation, counter_cache: :count
end
