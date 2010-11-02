require 'spec_helper'

describe "trainings/show.html.erb" do
  before(:each) do
    @training = assign(:training, stub_model(Training,
      :title => "Title",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Location/)
  end
end
