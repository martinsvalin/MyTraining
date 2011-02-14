require 'spec_helper'

describe "people/new.html.erb" do
  before(:all) do
    @person = Person.new
  end

  it "renders new person form" do
    render
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_email", :name => "person[email]"
    end
  end
end
