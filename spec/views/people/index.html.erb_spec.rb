require 'spec_helper'

describe "people/index.html.erb" do
  before(:all) do
    @people = [Factory.create(:person), Factory.create(:person)]
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => @people.first.name
    assert_select "tr>td", :text => @people.first.email
  end
end
