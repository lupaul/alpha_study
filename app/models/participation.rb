class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity, counter_cache: true
end
