class Enrollment < ApplicationRecord
  belongs_to :cooperation

  def add_user
    newuser = User.new
    newuser.name = @enrollment.name
    newuser.school = @enrollment.school
    newuser.email = @enrollment.email
  end
end
