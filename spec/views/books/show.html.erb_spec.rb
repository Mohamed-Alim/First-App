require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "Name",
      :Author_name => "Author Name",
      :Library_name => "Library Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Author Name/)
    expect(rendered).to match(/Library Name/)
  end
end
