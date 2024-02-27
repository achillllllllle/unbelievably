class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if reservation.update(:status)
      redirect_to reservation_path(reservation), notice: 'Reservation validated successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :wonder_id, :start_date, :end_date, :price, :accepted)
  end
end
