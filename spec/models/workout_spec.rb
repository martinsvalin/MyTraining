require 'spec_helper'

describe Workout do
  describe "validations" do
    it "should have a person" do
      Factory.build(:workout, :person => nil).should be_invalid
    end

    it "should have a training" do
      Factory.build(:workout, :training => nil).should be_invalid
    end

    it "should have a number as points" do
      Factory.build(:workout, :points => "abc").points.should be_an_instance_of(Fixnum)
    end

    it "should set points to default_points if they are not given" do
      workout = Factory.create(:workout, :points => nil)
      workout.points.should == workout.training.default_points
    end
  end
end
