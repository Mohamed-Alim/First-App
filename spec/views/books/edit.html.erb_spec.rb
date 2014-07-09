require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "MyString",
      :Author_name => "MyString",
      :Library_name => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_name[name=?]", "book[name]"

      assert_select "input#book_Author_name[name=?]", "book[Author_name]"

      assert_select "input#book_Library_name[name=?]", "book[Library_name]"
    end
  end
end
