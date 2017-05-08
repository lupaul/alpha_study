class AccountController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to :profile
  end

  def profile
  end

  def check_calender
    @activities = current_user.activityships
    @reservations = current_user.participated_reservation
  end

  def check_liked
    @activities = current_user.likes.where(likeable_type: "Activity")
    @reservations = current_user.likes.where(likeable_type: "Reservation")
    @experts = current_user.likes.where(likeable_type: "Expert")
  end

end
