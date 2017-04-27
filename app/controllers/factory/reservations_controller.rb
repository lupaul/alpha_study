class Factory::ReservationsController < ApplicationController
  before_action :reservation_find, except: [ :index, :new, :create ]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.save! ? redirect_to(reservations_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @reservation.update!(reservation_params) ? redirect_to(reservation_path) : render(:edit)
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

    def reservation_params
      params.require(:reservation).permit(:subject, :is_online, :location, :datetime, :card_image)
    end

    def reservation_find
      @reservation = Reservation.find(params[:id])
    end
end
