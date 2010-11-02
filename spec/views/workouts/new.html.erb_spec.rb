require 'spec_helper'

describe "workouts/new.html.erb" do
  before(:each) do
    assign(:workout, stub_model(Workout,
      :person => "",
      :training => "",
      :points => ""
    ).as_new_record)
  end

  it "renders new workout form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => workouts_path, :method => "post" do
      assert_select "input#workout_person", :name => "workout[person]"
      assert_select "input#workout_training", :name => "workout[training]"
      assert_select "input#workout_points", :name => "workout[points]"
    end
  end
end
