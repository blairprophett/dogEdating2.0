class ParksController < ApplicationController
  before_action :authenticate_user!

  def index
    yelp_params = {
           limit: 15,
           term: 'dog park'
          }
          
    address = Geocoder.search(params[:park][:address])

    if address.first == nil
      @coordinates = { latitude: 37.7577, longitude: -122.4376 }
    else
      @latitude = address.first.data["point"]["coordinates"].first
      @longitude = address.first.data["point"]["coordinates"].last
      @coordinates = { latitude: @latitude, longitude: @longitude }
    end

    @request = Yelp.client.search_by_coordinates(@coordinates, yelp_params).to_json
    
    @results = JSON.parse(@request)

    @yelp_info = @results['businesses']
    # binding.pry
  end

  def search
     @results = Park.near(params[:location])
  end

  def new
    @park = Park.new
  end

  def create
    if current_user.dog.nil?
      flash[:alert] = "Oops! You'll need to add your dog to access that!"
      redirect_to new_dog_path
    else
      @park = Park.ensure_from_yelp_data(park_params)
      redirect_to(park_path @park)
    end
  end

  # def show_from_yelp
  #   @park = Park.ensure_from_yelp_data(park_params)

  #   if @park.nil?
  #     flash[:alert] = "Oops! That resource is not available."
  #     redirect_to '/parks'
  #   else
  #     render :show
  #   end
  # end  

  def show
    @park = Park.find_by_id(params[:id])
    
    if @park.nil?
      flash[:alert] = "Oops! That resource is not available."
      redirect_to '/parks'
    else
      render :show
    end
  end

  private
    def park_params
      params.require(:park).permit(:yelp_id, :address, :name, :street_address, :city, :state, :zip, :img_url)
    end

end
