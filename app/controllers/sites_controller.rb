class SitesController < ApplicationController

  def landing
    params = {
           limit: 3,
           category_filter: 'dog_parks',
           # term: params[:term]
         }
    @request = (Yelp.client.search('San Francisco', params).to_json)
   
    @results = JSON.parse(@request)
    # binding.pry
  end

end