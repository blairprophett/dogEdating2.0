class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_dog

  #ensure method in model
  def create
    @favorite = @dog.favorites.ensure_favorite_from_park_data(new_favorite_params)
    redirect_to dog_path(@dog)
  end

  # def destroy
  #   Favorite.find(params[:id]).destroy
  #   redirect_to dog_path(@dog.id)
  # end

  private

    def new_favorite_params
      params.require(:favorite).permit(:park_id)
    end 

    def load_dog
      @dog = Dog.find(params[:dog_id])
      raise "Oops! You Do Not Have Access To That." unless @dog.user == current_user
    end

end