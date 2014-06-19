class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.create dog_params
    redirect_to(dog)
  end

  def show
    @dog = Dog.find_by_id(params[:id])
  end


  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :image, :park_id)
    end
end
