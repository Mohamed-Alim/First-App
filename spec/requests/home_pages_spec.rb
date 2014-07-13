require 'rails_helper'

RSpec.describe "Home Pages", :type => :request do
 describe "Home Page" do
 	it "should have the content'Our Demo App'" do
 		visit 'home_page/home'
 		page.should have_content('Our Demo App')
 		page.should have_content('This is the Home page')
 		page.find 'meta[name="description"]', :visible => false
 		page.should have_selector('h1', :text => 'Our Demo App')
 		expect(page).to have_title('Demo App | Home')
 	end
 end
 	describe "About page" do
	 	it "should have the content'About Us'" do
	 		visit 'home_page/about'
	 		page.should have_content('About Us')
	 		page.should have_content('This is the about page')
	 		page.find 'meta[name="description"]', :visible => false
	 		page.should have_selector('h1', :text => 'About Us')
	 		expect(page).to have_title('Demo App | About Us')
 	end
	 
	 end
	  describe "Location Page" do
	 	it "should have the content'Location'" do
	 		visit 'home_page/location'
	 		page.should have_content('Location')
	 		page.find 'meta[name="description"]', :visible => false
	 		page.should have_selector('h1', :text => 'Location')
	 		expect(page).to have_title('Demo App | Location')
	 	end
  end
  describe "Contact Page" do
	 	it "should have the content'Contact Us'" do
	 		visit 'home_page/contact'
	 		page.should have_content('Contact Us')
	 		page.should have_content('This is the contact page')
	 		page.find 'meta[name="description"]', :visible => false
	 		page.should have_selector('h1', :text => 'Contact Us')
	 		expect(page).to have_title('Demo App | Contact Us')

	 	end
	 end

	 #excpect(page).to have_title('About Us')
	
end