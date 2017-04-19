class Factory::FactoriesController < ApplicationController
  def index
    @schools    = School.all.limit(5)
    @courses    = Course.all.limit(5)
    @licenses   = License.all.limit(5)
    @activities = Activity.all.limit(5)
  end
end
