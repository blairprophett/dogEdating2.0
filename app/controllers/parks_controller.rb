class ParksController < ApplicationController

  def index
    yelp_params = {
           limit: 15,
           term: 'dog park'
           # category_filter: 'dog_parks'
          }

    address = Geocoder.search(params[:address])

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

  end

  def search
     @results = Park.near(params[:location])
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.ensure_from_yelp_data(park_params)
    redirect_to(park_path @park)
  end

  def show_from_yelp
    @park = Park.ensure_from_yelp_data(park_params)
    render :show
  end  

  def show
    @park = Park.find(params[:id])
    # @dogs = @park.dogs
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
      if @park.update_attributes(park_params)
        redirect_to(@park)
      else
        render :edit
      end
    end

  private
    def park_params
      params.require(:park).permit(:yelp_id, :name, :street_address, :city_state_zip, :img_url)
    end

end
