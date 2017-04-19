class Enrollment < ApplicationRecord
  belongs_to :cooperation

  def is_partner?
    User.where(email: email).present?
  end
end
