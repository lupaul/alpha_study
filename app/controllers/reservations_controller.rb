class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end
  
  def participate
    reservation = Reservation.find(params[:id])
    if Appointment.create!(user: current_user, reservation: reservation)
      redirect_to action: :index, notice: '預約成功'
    else
      redirect_to action: :index, notice: '預約失敗'
    end
  end

  def cancel
    reservation = Reservation.find(params[:id])
    appointment = Appointment.where(user: current_user, reservation: reservation).first
    if appointment.destroy
      redirect_to :back, notice: '取消成功'
    else
      redirect_to :back, notice: '取消失敗'
    end
  end
end
