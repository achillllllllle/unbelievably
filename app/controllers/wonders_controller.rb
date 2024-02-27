class WondersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wonders = Wonder.all
  end

  def show
    @wonder = Wonder.find(params[:id])
  end

  def new
    @wonder = Wonder.new
    respond_to do |format|
      format.html # Pour les requêtes HTML, renvoie le formulaire complet
      format.js { render layout: false } # Pour les requêtes AJAX, renvoie seulement le formulaire sans layout
    end
  end

  def create
    @wonder = Wonder.new(wonder_params)
    @wonder.user = current_user
    if @wonder.save
      redirect_to wonder_path(@wonder)
    else
      render :new, status: :unprocessable_entity
      raise
    end
  end

  private

  def wonder_params
    params.require(:wonder).permit(:title, :price_per_day, :type, :location, :category, :content, :user_id)
  end
end
