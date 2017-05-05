class Admin::ReservationsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

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

  def checkout

    @consultation = Consultation.find(params[:consulid])
    @reservations = current_user.reservations

    respond_to do |format|
      format.js
    end

  end

  def join
    if params[:consultation] && params[:reservation]
      consultation = Consultation.find(params[:consultation])
      reservation = Reservation.find(params[:reservation])
      consultation.user.participated_reservation << reservation
      flash[:notice] = "成功加入預約活動 "

    end
    redirect_to admin_school_reservations_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:subject, :datetime)
  end
end
