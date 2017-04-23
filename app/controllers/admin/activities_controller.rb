class Admin::ActivitiesController < ApplicationController
  layout "admin"

  def index
    @activities = current_user.activities
  end
end
