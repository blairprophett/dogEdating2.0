class DogsController < ApplicationController
#confirms user is signed in
before_action :authenticate_user!

before_filter :current_user, only: [:create, :new, :destroy]

  def new
    @dog = Dog.new

    if current_user.dog.nil?
      render :new
    else
      flash[:alert] = "Sorry! We only allow one dog per account at this time."
      redirect_to '/'
    end

    # def age(dob)
    #   now = Time.now.utc.to_date
    #   now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    # end
  end

  def create
    dog = Dog.new dog_params 
    dog.user_id = current_user.id
    dog.save
    redirect_to(dog)
  end

  def destroy
    Dog.find_by_id(params[:id]).destroy

    if @dog.nil?
      flash[:alert] = "Oops! You don't have permissions for that."
      redirect_to dog_path(params[:id])
    else 
      render :destroy
      redirect_to '/'
    end
  end

  def show
    @dog = Dog.find_by_id(params[:id])
    
    if @dog.nil?
      flash[:alert] = "Oops! That resource is not available."
      redirect_to '/'
    end
  end


  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :image)
    end
end
