require 'spec_helper'

def create_user
	User.create
end



describe 'User' do

	before(:each) do
		@user = create_user
	end

	it 'can sign up' do
		visit '/users/sign_up'
		fill_in "Email", with: 'sam@sam.co.uk'
		fill_in "Password", with: '12331233'
		fill_in "Password confirmation", with: '12331233'
		click_button "Sign up" 

		expect(page).to have_content("Logged in as sam@sam.co.uk")
	end	
	
end


