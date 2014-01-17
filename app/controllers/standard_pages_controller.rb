require 'yajl'
class StandardPagesController < ApplicationController
  def home
  	if signed_in?
  	@restaurant = current_user.restaurants.build
  	@feed_items = current_user.feed.paginate(page: params[:page])
  	end
    @near=params[:location]
    @query=params[:query]
    client = Foursquare2::Client.new(:client_id => 'OB3YDICTV5MDREL5ZUIZRAFXYL4GH2QTIJDNEQMLQV3DBN44', :client_secret => '0A4MHKMV2WKUVLXDLYD0UAAFQ3IGBNGHMO0BVA2MIAYXRWCF')
    @response=client.search_venues(:near => 'flower mound tx', :query => 'Starbucks')
    @response=@response.to_json
    @response = StringIO.new(@response)
    parser = Yajl::Parser.new
    @response = parser.parse(@response)

  end

  def contact
  end

  def help
  end
end
 