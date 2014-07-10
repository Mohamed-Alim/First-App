require 'rails_helper'

RSpec.describe "Home Pages", :type => :request do
 describe " Home Page" do
 	it "should have the content'First app'" do
 		visit 'home_page/home'
 		page.should have_content('First app')
 	end
  end
end
