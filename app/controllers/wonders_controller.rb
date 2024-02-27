class WondersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # path = request.original_url
    @wonders = Wonder.all
  end

  def show
    @wonder = Wonder.find(params[:id])
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
      raise
    end
  end

  private

  def wonder_params
    params.require(:wonder).permit(:title, :price_per_day, :type, :location, :category, :content, :user_id)
  end
end
