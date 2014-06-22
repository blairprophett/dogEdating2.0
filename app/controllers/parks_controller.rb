class ParksController < ApplicationController

  def search
    params = {
           limit: 3,
           category_filter: 'dog_parks',
           #term: params[:term],
         }

    coordinates = { latitude: 37.7577, longitude: -122.4376 }

    @request = Yelp.client.search_by_coordinates(coordinates, params).to_json
   
    @results = JSON.parse(@request)

    @yelp_info = @results['businesses']

    # @yelp_info.each do |business|
    #    @name = business['name']
       # binding.pry
    #   @img = business['image_url']
    #   @neighborhood = business['location']['neighborhoods'][0]
    #   @address = business['location']['address'][0]
    #   @zip = business['location']['display_address'][2]
    #   @yelp_url = business['url']
   # end
  end


end