require 'spec_helper'

describe "workouts/edit.html.erb" do
  # before(:each) do
  #   @workout = assign(:workout, stub_model(Workout,
  #     :new_record? => false,
  #     :person => "",
  #     :training => "",
  #     :points => ""
  #   ))
  # end

  it "renders the edit workout form" do
    pending
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => workout_path(@workout), :method => "post" do
      assert_select "input#workout_person", :name => "workout[person]"
      assert_select "input#workout_training", :name => "workout[training]"
      assert_select "input#workout_points", :name => "workout[points]"
    end
  end
end
