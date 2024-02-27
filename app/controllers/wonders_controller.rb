class WondersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    referrer = request.referrer
    if params["search"] && params["search"]["query"].present?
      # Logique à exécuter si la requête vient de l'URL spécifiée
      query = params["search"]["query"]
      @wonders = Wonder.where("title LIKE ?", "%#{query}%")
      # Requette SQL =  SELECT * FROM wonders WHERE title LIKE 'params["search"]["query"]%';
    else
      # Logique par défaut si la requête ne vient pas de l'URL spécifiée
      @wonders = Wonder.all
    end

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
    @wonder.user = current_user
    if @wonder.save
      redirect_to wonder_path(@wonder)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wonder_params
    params.require(:wonder).permit(:title, :price_per_day, :type, :location, :category, :content, :user_id, :photos => [])
  end
end
