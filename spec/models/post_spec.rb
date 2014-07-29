require 'rails_helper'

RSpec.describe Post, :type => :model do

	let(:user) {FactoryGirl.create(:user)}

	before do
		@post = user.post.build(title: "Ay 7aga", content: "Lorem ipsum", user_id: user.id)
	end
	subject(@post)
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should respond_to(:user)}

	it {should be_valid}

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Post.new(user_id: "1"_)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user_id is not present" do
		before {@post.user_id = nil}
		it{should_not be_valid}
	end
	describe "with blank content" do
		before {@post.content = " "}
		it {should_not be_valid}
	end
	describe "with content that is too long" do
		before {@post.content = "a"*141}
		it {should_not be_valid}
	end
end
