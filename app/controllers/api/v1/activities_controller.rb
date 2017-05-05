class Api::V1::ActivitiesController < ApiController
  before_action :activity_find, except: [:index, :create]
  before_action :authenticate_user!, only: [:participate, :cancel]
  
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

  def participate
    if Participation.where(user: current_user, activity: @activity).empty?
      if Participation.create!(user: current_user, activity: @activity)
        render json: { message: '報名成功！' } 
      else
        render json: { message: '報名失敗！' } 
      end
    else
      render json: { message: '你已經報名過了'}
    end
  end

  def cancel
    participation = Participation.where(user: current_user, activity: @activity).first
    if participation.destroy
      render json: { message: '取消成功！' }
    else
      render json: { message: '取消失敗！' }
    end
  end

  private

    def activity_params
      params.permit(:subject, :description, :datetime, :location, :presenter_name, :presenter_info, :organizer)
    end

    def activity_find
      @activity = Activity.find(params[:id])
    end
end
