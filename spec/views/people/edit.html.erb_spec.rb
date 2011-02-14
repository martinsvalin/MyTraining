require 'spec_helper'

describe "people/edit.html.erb" do
  before(:all) do
    @person = Factory.create(:person)
  end

  it "renders the edit person form" do
    render
    assert_select "form", :action => person_path(@person), :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_email", :name => "person[email]"
    end
  end
end
