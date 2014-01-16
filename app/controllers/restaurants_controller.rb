class RestaurantsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def index
  end

  def create
  	@restaurant = current_user.restaurants.build(restaurant_params)
  	if @restaurant.save
  		flash[:success]="Restaurant added!"
  		redirect_to root_url
  	else
  		@feed_item = []
  		render 'standard_pages/home'
  	end
  end

  def destroy
  	@restaurant.destroy
  	redirect_to root_url
  end

  private

  def restaurant_params
  	params.require(:restaurant).permit(:name, :address, :city, :state, :postal, :phone, :category, :note)
  end

  def correct_user
  	@restaurant = current_user.restaurants.find_by(id: params[:id] )
  	redirect_to root_url if @restaurant.nil?
  end
end
