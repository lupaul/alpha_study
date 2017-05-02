class AccountController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to :profile
  end

  def profile
  end

  def check_calender
    @activities = current_user.activityships
  end

  def check_liked
  end

end
