class Factory::CoursesController < ApplicationController
  before_action :course_find, except: [ :index, :new, :create ]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.new(course_params)
    course.save! ? redirect_to(courses_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @course.update!(course_params) ? redirect_to(course_path) : render(:edit)
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

    def course_params
      params.require(:course).permit(:title, :description, :school_id, :license_id, :card_image, :banner_image)
    end

    def course_find
      @course = Course.find(params[:id])
    end
end
