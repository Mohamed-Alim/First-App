require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do
	subject {page}
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

		
			it "should have the correct title" do
				expect(page).to have_title(user.name)
			end

			it {should have_link('Profile', href: user_path(user))}
			it {should have_link('Sign out', href: signout_path)}

			describe "followed by signout" do
			  before {click_link "Sign out"}
			  it{should have_button('Sign in')}
			end

		end
	end
end
