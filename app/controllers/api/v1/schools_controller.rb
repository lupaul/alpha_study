class Api::V1::SchoolsController < ApiController
  before_action :school_find, except: [:index, :create]
  
  def index
    @schools = School.all
  end

  def create
    schools = School.new(school_params)
    schools.save! ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def show
  end

  def update
    @school.update(school_params) ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def destroy
    @school.destroy ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  private

    def school_params
      params.permit(:name, :description, :location, :address, :email, :liked, :followed)
    end

    def school_find
      @school = School.find(params[:id])
    end
end
