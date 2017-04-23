class Api::V1::CoursesController < ApiController
  before_action :course_find, except: [:index, :create]
  
  def index
    @courses = Course.all
  end

  def create
    courses = Course.new(course_params)
    courses.save! ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def show
  end

  def update
    @course.update(course_params) ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def destroy
    @course.destroy ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  private

    def course_params
      params.permit(:title, :description, :liked)
    end

    def course_find
      @course = Course.find(params[:id])
    end
end
