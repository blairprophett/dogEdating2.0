class SitesController < ApplicationController

  def landing
    params = {
           limit: 3,
           category_filter: 'dog_parks'
         }

    # locale = { lang: 'fr' }

    # @results = Yelp.client.search('San Francisco', params, locale)
    # params = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('San Francisco', params)
  end

end