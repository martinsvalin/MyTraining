require 'spec_helper'

describe "workouts/index.html.erb" do
  # before(:each) do
  #   assign(:workouts, [
  #     stub_model(Workout,
  #       :person => "",
  #       :training => "",
  #       :points => ""
  #     ),
  #     stub_model(Workout,
  #       :person => "",
  #       :training => "",
  #       :points => ""
  #     )
  #   ])
  # end

  it "renders a list of workouts" do
    pending
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
