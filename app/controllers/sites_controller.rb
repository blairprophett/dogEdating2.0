class SitesController < ApplicationController

  def landing
    params = {
           limit: 3,
           category_filter: 'dog_parks',
           #term: params[:term],
         }
    @request = Yelp.client.search('San Francisco', params).to_json
   
    @results = JSON.parse(@request)

    @yelp_info = @results['businesses']

    # @yelp_info.each do |business|
    #   @name = business['name']
    #   @img = business['image_url']
    #   @neighborhood = business['location']['neighborhoods'][0]
    #   @address = business['location']['address'][0]
    #   @zip = business['location']['display_address'][2]
    #   @yelp_url = business['url']
    # end

  end

end

