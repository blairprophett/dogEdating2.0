class FavoritesController < ApplicationController

  before_action :load_dog

  def create 
    # @dog.favorites.create(new_favorite_params)
    # redirect_to dog_path(@dog)

    @favorite = @dog.favorites.ensure_favorite_from_park_data(new_favorite_params)
    redirect_to dog_path(@dog)
  end

  private

    def new_favorite_params
      params.require(:favorite).permit(:park_id)
    end 

    def load_dog
      @dog = Dog.find(params[:dog_id])
      raise "Not Your Dog!" unless @dog.user == current_user
    end

end