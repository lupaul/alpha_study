class WelcomeController < ApplicationController
  def index
    # flash[:notice] = "success"
    # flash[ :warning ] = "warning!"
    # flash[ :alert ] = "alert!!"
    @activities = Activity.all.limit(2)
    @experts = Expert.all.limit(2)
    @reservations = Reservation.all.limit(2)
    @licenses = License.all.limit(2)
    @schools = School.all.limit(2)
  end
end
