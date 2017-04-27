class Admin::SchoolsController < ApplicationController
  layout "admin"

  def index
    #code
  end

  def account_activity
    @school = User.find(current_user)
  end

  def consultations
    @consultations = current_user.school.consultations
  end


end
