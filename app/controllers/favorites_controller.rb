class FavoritesController < ApplicationController
  def create
    @wonder = Wonder.find(params[:wonder_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.wonder = @wonder
    # @user_favorites = current_user.favorites.order(created_at: :desc)


    respond_to do |format|
      if @favorite.save!
        format.html { redirect_to @wonder, notice: "Wonder saved successfully" }
        format.json do
          render json: {
            success: true
          }
        end
      else
        format.html { redirect_to @wonder, alert: "Can't save this wonder" }
        format.json do
          render json: {
            success: false
          }
        end
      end
    end
  end

  def destroy
    @wonder = Wonder.find(params[:wonder_id])
    @favorite = Favorite.find_by(user: current_user, wonder: @wonder)
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to wonders_path, status: :see_other }
      format.json { render json: { success: true } }
    end
  end

  def favorite_params
    params.require(:favorite).permit(:wonder_id)
  end
end
