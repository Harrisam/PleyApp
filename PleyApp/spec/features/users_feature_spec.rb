require 'spec_helper'

def create_user
	User.create
end



describe 'User' do

	before(:each) do
		@user = create_user
	end

	it 'can sign up' do
		sign_up
		expect(page).to have_content("Logged in as sam@sam.co.uk")
	end	
	
end


