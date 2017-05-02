class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @courses = Course.all
  end

end
