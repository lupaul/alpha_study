class Api::V1::IosController < ApplicationController

  def english
    courses = Category.find(1).licenses.map {|l| l.courses}
    @courses = courses.flatten
  end

  def fashion
    courses = Category.find(3).licenses.map {|l| l.courses}
    @courses = courses.flatten
  end

  def cook
    courses = Category.find(2).licenses.map {|l| l.courses}
    @courses = courses.flatten
  end

end
