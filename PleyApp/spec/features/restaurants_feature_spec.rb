require 'spec_helper'

def create_restaurant
	Restaurant.create(title: 'Funky Monkey', description: 'some description')
end


describe 'the restaurant page' do 
	it 'should display a restaurant' do
		create_restaurant
		visit '/restaurants'

		expect(page).to have_content 'Funky Monkey'

	end
end

describe 'an individual restaurant' do
	it 'has its own page' do 
		create_restaurant
		visit '/restaurants'
		click_link "Funky Monkey"

		expect(page).to have_css 'h2', text: 'Funky Monkey'
		expect(page).to have_content 'some description'
	end
end

describe 'new restaurant form' do  
	it 'creates a new restaurant' do 
		visit '/restaurants/new'
		within '.new_restaurant' do
			fill_in "Title", with: 'Brand new restaurant'
			fill_in "Description", with: 'some description'
			click_button "Create Restaurant"
		end
		expect(page).to have_content("Brand new restaurant")
		expect(page).to have_content("some description")
	end
end


