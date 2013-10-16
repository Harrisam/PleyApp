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

		it 'should show the name of the restaurant' do 
			click_link 'Add a review'
			expect(page).to have_content 'Funky Monkey'
		end
	end

	describe 'it should have a score out of 5' do 

		it 'shows number after been given a score' do
			click_link 'Add a review'
			fill_in 'some description', with: 'the coffee here is fab' 
			choose '3'
			click_button 'Add Review'
			expect(page).to have_content '3'
		end

	end


end