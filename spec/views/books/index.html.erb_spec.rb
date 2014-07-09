require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :name => "Name",
        :Author_name => "Author Name",
        :Library_name => "Library Name"
      ),
      Book.create!(
        :name => "Name",
        :Author_name => "Author Name",
        :Library_name => "Library Name"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author Name".to_s, :count => 2
    assert_select "tr>td", :text => "Library Name".to_s, :count => 2
  end
end
