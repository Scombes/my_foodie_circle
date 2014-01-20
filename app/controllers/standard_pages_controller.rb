class StandardPagesController < ApplicationController
  
  def home
  	if signed_in?
  	@restaurant = current_user.restaurants.build
  	@feed_items = current_user.feed.paginate(page: params[:page])
  	end
    @near=params[:location]
    @query=params[:query]
    @restaurant_id=params[:restaurant_id]
    if @query != nil
      @query_plused=params[:query].tr(' ', '+')
      @response= HTTParty.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query='+@query_plused+'&sensor=false&key=AIzaSyCpcL-60e_blJaX4hV3H-Uc-TPPhfISOQg')
      RestClient.proxy = ENV["PROXIMO_URL"] if ENV["PROXIMO_URL"]
      @response = RestClient.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query='+@query_plused+'&sensor=false&key=AIzaSyCpcL-60e_blJaX4hV3H-Uc-TPPhfISOQg')
      @response = JSON.parse(@response)
    end
    if @restaurant_id != nil
      @restaurant_detail= HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?reference='+@restaurant_id+'&sensor=false&key=AIzaSyCpcL-60e_blJaX4hV3H-Uc-TPPhfISOQg')
      RestClient.proxy = ENV["PROXIMO_URL"] if ENV["PROXIMO_URL"]
      @restaurant_detail= RestClient.get('https://maps.googleapis.com/maps/api/place/details/json?reference='+@restaurant_id+'&sensor=false&key=AIzaSyCpcL-60e_blJaX4hV3H-Uc-TPPhfISOQg')
      @restaurant_detail= JSON.parse(@restaurant_detail)
    end
    
  end

  def contact
  end

  def help
  end
end
 