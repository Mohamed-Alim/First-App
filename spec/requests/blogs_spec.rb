require 'rails_helper'

RSpec.describe "Blogs", :type => :request do
	describe "Home Page" do
		it "should have the content'Hello, world!'" do
			visit '/'
			page.should have_selector('h1', :text => 'Hello, world!')
			expect(page).to have_title('Demo')
    end
  end
  describe "About us" do
		it "should have the content'About Us'" do
			visit '/about'
			page.should have_selector('h1', :text => 'About Us')
			expect(page).to have_title('Demo | About Us')
    end

  end
  it "should have the right links on layout" do
    	visit root_path
    	click_link"About Us"
    	expect(page).to have_title(full_title('About Us'))
    	click_link"Sign Up"
    	expect(page).to have_title(full_title('Sign up'))
    end
end
