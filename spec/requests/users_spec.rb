require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "Sign up page" do
  	before {visit signup_path}
  	it "should have the content'Sign up'" do
			
				expect(page).to have_selector('h1', :text => 'Sign up')
				expect(page).to have_title('Demo | Sign up')
			
		end
  end
  describe "Profile page" do
  	let(:user) {FactoryGirl.create(:user)}
  	before {visit user_path(user)}

  	it "should have the content'Profile page'" do
  		expect(page).to have_selector('h1', :text => user.name)
  		expect(page).to have_title(user.name)
  	end 
  end 
  describe"signup" do
  	before {visit signup_path}

  	let(:submit) {"Create my account"}

  	describe "with invalid information" do
  		it "should not create a user" do
  			expect { click_button submit }.not_to change(User, :count)
  			# old_count = User.count
  			# click_button submit
  			# new_count = User.count
  			# expect(new_count).to eq(old_count)
  		end
  	end
  	describe "with valid information" do
  		before do 
  			within("form#new_user") do
  				fill_in "Name", with:"example"
  				fill_in "Email", with:"user@example.com"
  				fill_in "Password", with:"batman93"
  				fill_in "Confirmation", with:"batman93"
  			end
	  	end
  		it "should create a user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  			# old_count = User.count
  			# click_button submit
  			# new_count = User.count
  			# expect(new_count).to eq(old_count + 1)
  		end
  		describe "after saving a user" do
  			before {click_button submit}

  			let(:user) {User.find_by_email("user@example.com")}

  			it {expect(page).to have_title(user.name)}
  		end
  	end
  end
end
