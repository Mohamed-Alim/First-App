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
			before {sign_in user}

		
			it "should have the correct title" do
				expect(page).to have_title(user.name)
			end

			it {should have_link('Profile', href: user_path(user))}
			it {should have_link('Sign out', href: signout_path)}
			it {should have_link('Settings', href: edit_user_path(user))}

			describe "followed by signout" do
			  before {click_link "Sign out"}
			  it{should have_button('Sign in')}
			end

		end
	end
	describe "authorization" do
		describe " for non signed in users" do
			let(:user) {FactoryGirl.create(:user)}
			describe "when attemptig to visit a protected page" do
				before do
					visit edit_user_path(user)
					fill_in "Email", with: user.email
					fill_in "Password", with:user.password
					click_button "Sign in"
				end

				describe "after signing in" do
					it "should render the desired protected page" do
						expect(page).to have_title("Edit User")
					end
					describe "when signing in again" do
						before do
							click_link "Sign out"
							fill_in "Email", with: user.email
							fill_in "Password", with: user.password
							click_button "Sign in"
						end
						it "should render the default (profile) page" do
							expect(page).to have_title(user.name)
						end
					end
				end
			end
			describe "users controller" do
				describe "visiting the edit page" do
					before{visit edit_user_path(user)}
					it { expect(page).to have_button('Sign in') }
				end
				describe "visiting users index" do
					before {visit users_path}
				end
			end
		end
		describe "as wrong user" do
			let(:user){FactoryGirl.create(:user)}
			let(:wrong_user){FactoryGirl.create(:user, email:"wrong@example.com")}
			before {sign_in user}

			describe "visiting Users#edit page" do
				before{ visit edit_user_path(wrong_user)}
				it {expect(page).not_to have_title("Edit user")}
			end
			describe "submitting a PUT request to the Users#update action" do
				before {put user_path(wrong_user)}
				specify {response.should redirect_to (root_path)}
			end 
		end
	end
end
