class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:participate, :cancel]

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

  def cancel
    @activity = Activity.find(params[:id])
    participation = Participation.find_by(activity: @activity)
    if participation.destroy
      redirect_to :back, notice: '取消成功！'
    else
      redirect_to :back, notice: '取消失敗！'
    end
  end
end
