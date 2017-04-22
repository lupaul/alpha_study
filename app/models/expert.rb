class Expert < ApplicationRecord
  belongs_to :user, optional: true
end
