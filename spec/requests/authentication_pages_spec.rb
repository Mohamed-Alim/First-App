require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do
	describe "signin" do
		before {visit root_path}
		it {page.should have_selector('h1', :text => 'Hello, world!')}
		it {expect(page).to have_title('Demo')}

		describe "with invalid information" do
			before {click_button "Sign in"}

			it {expect(page).to have_selector('div.alert.alert-danger', text: 'Invalid')}
		end
		describe "with valid information" do
			let(:user) {FactoryGirl.create(:user)}
			before do

				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it {should have_selector('title', text: user.name)}
			it {should have_link('Profile', href: user_path(user))}
			it {should have_link('Sign out', href: sessions_destroy)}
		end
	end
end
