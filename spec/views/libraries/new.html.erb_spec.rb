require 'rails_helper'

RSpec.describe "libraries/new", :type => :view do
  before(:each) do
    assign(:library, Library.new(
      :Name => "MyString",
      :URL => "MyString"
    ))
  end

  it "renders new library form" do
    render

    assert_select "form[action=?][method=?]", libraries_path, "post" do

      assert_select "input#library_Name[name=?]", "library[Name]"

      assert_select "input#library_URL[name=?]", "library[URL]"
    end
  end
end
