class Factory::ActivitiesController < ApplicationController
  layout 'factory'
  before_action :activity_find, except: [ :index, :new, :create ]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.new(activity_params)
    activity.save! ? redirect_to(factory_activities_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @activity.update!(activity_params) ? redirect_to(factory_activity_path) : render(:edit)
  end

  def destroy
    @activity.destroy
    redirect_to factory_activities_path
  end

  private

    def activity_params
      params.require(:activity).permit(
        :subject, :description, :location, :datetime,
        :presenter_name, :presenter_info, :organizer,
        :card_image, :banner_image
      )
    end

    def activity_find
      @activity = Activity.find(params[:id])
    end
end
