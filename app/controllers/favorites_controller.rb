class FavoritesController < ApplicationController
  def create
    @wonder = Wonder.find(params[:wonder_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.wonder = @wonder

    if @favorite.save
      @user_favorites = current_user.favorites.order(created_at: :desc)
      redirect_to @wonder, notice: "Wonder saved successfully"
    else
      redirect_to @wonder, alert: "Can't save this wonder"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  def favorite_params
    params.require(:favorite).permit(:wonder_id)
  end
end
