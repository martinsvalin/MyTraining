require 'spec_helper'

describe "people/show.html.erb" do
  # before(:each) do
  #   @person = assign(:person, stub_model(Person,
  #     :name => "Name",
  #     :email => "Email"
  #   ))
  # end

  it "renders attributes in <p>" do
    pending
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
