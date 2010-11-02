require 'spec_helper'

describe "trainings/edit.html.erb" do
  before(:each) do
    @training = assign(:training, stub_model(Training,
      :new_record? => false,
      :title => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit training form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => training_path(@training), :method => "post" do
      assert_select "input#training_title", :name => "training[title]"
      assert_select "input#training_location", :name => "training[location]"
    end
  end
end
