class FavoritesController < ApplicationController

  before_action (load_dog)


  private

    def load_dog
      @dog = Dog.find(params[:dog_id])
    end

end