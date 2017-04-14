class WelcomeController < ApplicationController
  def index
    flash[:notice] = "success"
    flash[ :warning ] = "warning!"
    flash[ :alert ] = "alert!!"
  end
end
