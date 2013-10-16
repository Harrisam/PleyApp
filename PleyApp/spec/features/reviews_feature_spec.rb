require 'spec_helper'


def create_restaurant
	Restaurant.create(title: 'Funky Monkey', description: 'some description')
end

def create_review
	Review.create(note: 'Amazing', score: '5')
end


describe 'the restaurants page' do 

	before(:each) do
		@restaurant = create_restaurant
		@restaurant.reviews << create_review

		visit restaurant_path(@restaurant)
		# visit "/restaurants/#{@restaurant.id}"
	end

	describe 'the restaurants page' do 
		it 'should display the review' do
			expect(page).to have_content 'Amazing'
		end
	end

	describe 'writting a review' do

		it 'shows the review after it has been written' do 
			click_link 'Add a review'
			fill_in 'some description', with: 'the coffee here is fab'
			click_button 'Add Review'
			expect(page).to have_content 'the coffee here is fab'
		end
	end







	# describe 'an individual review' do
	# 	it 'has ' do 
	# 		create_review
	# 		visit '/restaurants'
			
	# 		expect(page).to have_css 'h2', text: 'Funky Monkey'
	# 		expect(page).to have_content 'some description'
	# 	end
	# end
end