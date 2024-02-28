class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @my_wonder = Wonder.new
    @my_wonders = @user.wonders
    @my_reservations = @user.reservations
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
