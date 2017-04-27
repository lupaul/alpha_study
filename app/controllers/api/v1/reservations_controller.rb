class Api::V1::ReservationsController < ApiController
  before_action :reservation_find, except: [:index, :create]
  
  def index
    @reservations = Reservation.all
  end

  def create
    reservations = Reservation.new(reservation_params)
    reservations.save! ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def show
  end

  def update
    @reservation.update(reservation_params) ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def destroy
    @reservation.destroy ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  private

    def reservation_params
      params.permit(:subject, :location, :datetime, :liked)
    end

    def reservation_find
      @reservation = Reservation.find(params[:id])
    end
end
