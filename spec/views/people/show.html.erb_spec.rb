require 'spec_helper'

describe "people/show.html.erb" do
  before(:all) do
    @person = Factory.create(:person)
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/#{@person.name}/)
    rendered.should match(/#{@person.email}/)
  end
end
