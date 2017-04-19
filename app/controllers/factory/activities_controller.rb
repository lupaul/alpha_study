class Factory::ActivitiesController < ApplicationController
  before_action :activity_find, except: [ :index, :new, :create ]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.new(activity_params)
    activity.save! ? redirect_to(activities_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @activity.update!(activity_params) ? redirect_to(activity_path) : render(:edit)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  private

    def activity_params
      params.require(:activity).permit(
        :subject, :description, :location, 
        :presenter_name, :presenter_info, :organizer
      )
    end

    def activity_find
      @activity = Activity.find(params[:id])
    end
end
