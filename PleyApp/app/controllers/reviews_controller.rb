class ReviewsController < ApplicationController

	# before_filter :authenticate_user!, only: [:new, :create]

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.create(params[:review].permit(:note))

		@restaurant.reviews << @review
		redirect_to restaurant_path(@restaurant)
	end
end



		