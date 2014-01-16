class StandardPagesController < ApplicationController
  def home
  	if signed_in?
  	@restaurant = current_user.restaurants.build
  	@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def contact
  end

  def help
  end
end
