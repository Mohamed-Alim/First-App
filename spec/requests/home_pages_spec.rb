require 'rails_helper'

RSpec.describe "Home Pages", :type => :request do
 describe "Home Page" do
 	it "should have the content'Home'" do
 		visit 'home_page/home'
 		page.should have_content('Home')
 	end
 	describe "About page" do
 	it "should have the content'About'" do
 		visit 'home_page/home'
 		page.should have_content('About')
 	end
  end
end
