class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[edit update destroy]

  def create
    @wonder = Wonder.find(params[:wonder_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.wonder = @wonder
    @price_per_participant = @wonder.price_per_participant
    @quantity = reservation_params[:nb_participants].to_i
    @price = @quantity * @price_per_participant
    @reservation.price = @price
    if @reservation.save
      redirect_to user_path(current_user)
    else
      redirect_to wonder_path(@wonder), alert: "Can't create reservation, check informations and try again"
    end
  end

  def edit
  end

  def update
    if current_user == @reservation.wonder.user #si c'est le proprio
      @reservation.update(accepted: true)
      redirect_to user_path(current_user)
    else

    end
  end

  def destroy
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :wonder_id, :book_date, :nb_participants, :price, :accepted)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
