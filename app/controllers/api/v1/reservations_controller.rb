class Api::V1::ReservationsController < ApiController
  before_action :reservation_find, except: [:index, :create]
  before_action :authenticate_user!, only: [:participate, :cancel]
  
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

  def participate
    if Appointment.where(user: current_user, reservation: @reservation).empty?
      if Appointment.create!(user: current_user, reservation: @reservation)
        render json: { message: '預約成功！' } 
      else
        render json: { message: '預約失敗！' } 
      end
    else
      render json: { message: '你已經預約過了'}
    end
  end

  def cancel
    appointment = Appointment.where(user: current_user, reservation: @reservation).first
    if appointment.destroy
      render json: { message: '取消成功！' }
    else
      render json: { message: '取消失敗！' }
    end
  end

  private

    def reservation_params
      params.permit(:subject, :location, :datetime, :liked)
    end

    def reservation_find
      @reservation = Reservation.find(params[:id])
    end
end
