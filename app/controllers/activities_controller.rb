class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: :participate

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def participate
    @activity = Activity.find(params[:id])
    if Participation.create!(user: current_user, activity: @activity)
      redirect_to :back, notice: '報名成功！'
    else
      redirect_to :back, notice: '報名失敗！'
    end
  end
end
