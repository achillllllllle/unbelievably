class ReservationsController < ApplicationController
  # creer methode juste pour la durer pour retourner un json pour qu'on puisse l'appeler en js pour rendre le dom dynamique

  def create
    @wonder = Wonder.find(params[:wonder_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.wonder = @wonder
    @price_per_day = @wonder.price_per_day
    @duration = reservation_params[:end_date].to_date - reservation_params[:start_date].to_date + 1
    @price = @duration * @price_per_day
    @reservation.price = @price
    if @reservation.save
      redirect_to user_path(current_user)
    else
      redirect_to wonder_path(@wonder), alert: "Can't create reservation, check informations and try again"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :wonder_id, :start_date, :end_date, :price, :accepted)
  end
end
