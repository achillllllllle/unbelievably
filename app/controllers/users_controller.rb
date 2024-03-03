class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    if current_user != set_user
      redirect_to "https://www.youtube.com/watch?v=dQw4w9WgXcQ", allow_other_host: true
      return
    end
    @my_wonders = @user.wonders
    @my_reservations = @user.reservations.order(created_at: :desc)

    @user = User.find(params[:id])
    @favorites = @user.favorites.includes(:wonder)

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
