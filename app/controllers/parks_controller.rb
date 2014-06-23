class ParksController < ApplicationController

  def index
    yelp_params = {
           limit: 3,
           category_filter: 'dog_parks'
          }

    address = Geocoder.search(params[:address])


    puts address.inspect

    coordinates = { latitude: 37.7577, longitude: -122.4376 }
    # coordinates = {latitude: params[:latitude], longitude: params[:longitude] }
    # binding.pry
    @request = Yelp.client.search_by_coordinates(coordinates, yelp_params).to_json
   
    @results = JSON.parse(@request)

    @yelp_info = @results['businesses']

  end

  def search
     @results = Park.near(params[:location])
  end
     
  # def index
  #   g = Geocoder.search(params[:location])
  #   g[0].data["geometry"]["location"].each_value do |x| 
  #     return x
  #   end
  # end

  # end

    # @yelp_info.each do |business|
    #    @name = business['name']
       # binding.pry
    #   @img = business['image_url']
    #   @neighborhood = business['location']['neighborhoods'][0]
    #   @address = business['location']['address'][0]
    #   @zip = business['location']['display_address'][2]
    #   @yelp_url = business['url']
   # end
  # end

  def new
    @park = Park.new
  end

  def create
    @park = Park.create park_params
    redirect_to(park)
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

  # def search
  #   @parks = Park.all
  #   @search = SimpleSearch.new SimpleSearch.get_params(params)
  #   if @search.valid?
  #     @parks = @search.search_within Park.all, :name
  #   end
  # end

  private
    def park_params
      params.require(:park).permit(:name, :address, :leash_rule, :image)
    end

end
