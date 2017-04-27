class Admin::ReservationsController < ApplicationController
  layout "admin"

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      flash[:notice] = "Successfully created!!!"
      redirect_to admin_school_reservations_path(current_user)
    else
      flash[:alert] = "Faill created!!!"
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:subject, :datetime)
  end
end
