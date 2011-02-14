require 'spec_helper'

describe "trainings/new.html.erb" do
  before(:all) do
    @training = Training.new
  end
  it "renders new training form" do
    render
    assert_select "form", :action => trainings_path, :method => "post" do
      assert_select "input#training_title", :name => "training[title]"
      assert_select "input#training_location", :name => "training[location]"
      assert_select "input#training_start_date", :name => "training[start_date]"
      assert_select "input#training_start_time", :name => "training[start_time]"
      assert_select "input#training_duration", :name => "training[duration]"
    end
  end
end
