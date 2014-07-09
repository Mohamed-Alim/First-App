require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :name => "MyString",
      :Author_name => "MyString",
      :Library_name => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_name[name=?]", "book[name]"

      assert_select "input#book_Author_name[name=?]", "book[Author_name]"

      assert_select "input#book_Library_name[name=?]", "book[Library_name]"
    end
  end
end
