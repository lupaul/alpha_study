class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @page = School.find(params[:id]).user.page
    render layout: 'preview'
  end
  
end
