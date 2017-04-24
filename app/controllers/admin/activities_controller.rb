class Admin::ActivitiesController < ApplicationController
  layout "admin"

  def index
    @activities = current_user.activities
  end

  def new
    @activity = current_user.activities.new
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      flash[:notice] = "Successfully created..."
      redirect_to admin_school_activities_path
    else
      flash[:alert] = "Faild created..."
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:subject, :datetime, :presenter_name,
                                     :description, :presenter_info, :organizer,
                                     :image, :location, :software, :is_online )
  end
end
