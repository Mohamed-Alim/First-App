require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "Sign up page" do
  	it "should have the content'Sign up'" do
			visit '/signup'
			page.should have_selector('h1', :text => 'Sign up')
			expect(page).to have_title('Demo | Sign up')
		end
  end
end
