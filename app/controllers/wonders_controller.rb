class WondersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_wonder, only: %i[show edit update destroy]

  def index
    if params["search"] && params["search"]["query"].present?
      query = params["search"]["query"]
      @wonders = Wonder.where("title ILIKE ?", "%#{query}%")
      if current_user
        @wonders = @wonders.select { |wonder| wonder.user != current_user}
      end
    else
      @wonders = Wonder.where.not(user: current_user)
    end
  end

  def show
    if current_user != @wonder.user
      @reservation = Reservation.new
    else
      @reservations = @wonder.reservations
    end
    @marker =
      {
        lat: @wonder.latitude,
        lng: @wonder.longitude
      }
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

  def edit
  end

  def update
    @wonder.update(wonder_params)
    redirect_to user_path(@wonder.user)
  end

  def destroy
    owner = @wonder.user
    if Favorite.find_by(wonder_id: @wonder.id)
      Favorite.find_by(wonder_id: @wonder.id).destroy
    end
    @wonder.destroy
    redirect_to user_path(owner)
  end

  def save_favorite
    @wonder = Wonder.find(params[:id])
    current_user.favorites << @wonder
  end

  private

  def set_wonder
    @wonder = Wonder.find(params[:id])
  end

  def wonder_params
    params.require(:wonder).permit(:title, :price_per_participant, :type, :location, :category, :content, :user_id, :long_description, :photos => [])
  end
end
