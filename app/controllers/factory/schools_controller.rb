class Factory::SchoolsController < ApplicationController
  before_action :school_find, except: [ :index, :new, :create ]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    school = School.new(school_params)
    school.save! ? redirect_to(schools_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @school.update!(school_params) ? redirect_to(school_path) : render(:edit)
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  private

    def school_params
      params.require(:school).permit(:name, :description, :location, :address, :email)
    end

    def school_find
      @school = School.find(params[:id])
    end
end
