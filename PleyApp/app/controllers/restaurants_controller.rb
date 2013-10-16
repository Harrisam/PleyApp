class RestaurantsController < ApplicationController

	before_filter :authenticate_user!, only: [:new, :create]

	def index
		@restaurants = Restaurant.all 
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		restaurant = Restaurant.create(params[:restaurant].permit(:title, :description))
		redirect_to restaurant_path(restaurant)
	end

end
