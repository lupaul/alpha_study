class Api::V1::ActivitiesController < ApiController
  before_action :activity_find, except: [:index, :create]
  
  def index
    @activities = Activity.all
  end

  def create
    activities = Activity.new(activity_params)
    activities.save! ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def show
  end

  def update
    @activity.update(activity_params) ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def destroy
    @activity.destroy ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  private

    def activity_params
      params.permit(:subject, :description, :location, :presenter_name, :presenter_info, :organizer)
    end

    def activity_find
      @activity = Activity.find(params[:id])
    end
end
