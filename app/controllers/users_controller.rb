class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @my_wonder = Wonder.new
    @my_wonders = @user.wonders
    @my_reservations = @user.reservations
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to wonders_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :phone, :mail, :password)
  end
end
