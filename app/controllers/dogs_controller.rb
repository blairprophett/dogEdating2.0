class DogsController < ApplicationController

before_filter :current_user, only: [:create, :new, :edit, :update, :destroy]

  #make admin only
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new

    if current_user.dog.nil?
      render :new
    else
      flash[:alert] = "Sorry! We only allow one dog per account at this time."
      redirect_to '/'
    end
  end

  def create
    dog = Dog.new dog_params 
    dog.user_id = current_user.id
    dog.save
    redirect_to(dog)
  end

  def edit
    if @dog.nil?
      flash[:alert] = "Oops! You don't have permissions for that."
      redirect_to dog_path(params[:id])
    else
      @dog = current_user.dog.find(params[:id])
      @dog = Dog.find(params[:id])
    end
  end

  def update
    @dog = Dog.find(params[:id])
      if @dog.update_attributes(dog_params)
        redirect_to(@dog)
      else
        render :edit
      end
  end

  def destroy
    Dog.find(params[:id]).destroy
    redirect_to parks_path
  end

  def show
    @dog = Dog.find_by_id(params[:id])
    
    if @dog.nil?
      flash[:alert] = "Oops! That resource is not available."
      redirect_to '/dogs/new'
    end
  end


  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :image)
    end
end
