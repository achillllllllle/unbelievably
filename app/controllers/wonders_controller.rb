class WondersController < ApplicationController
  def index
    @wonders = Wonder.all
  end

  def show
    @wonder = Wonder.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @wonder = Wonder.new
  end

  def create
    @wonder = Wonder.new(wonder_params)
    if @wonder.save
      redirect_to wonder_path(@wonder)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wonder_params
    params.require(:wonder).permit(:title, :price_per_day, :type, :location)
  end
end
