require 'spec_helper'

describe Training do
  describe "validations" do
    it "should have a title" do
      Factory.build(:training, :title => nil).should be_invalid
    end

    it "should have a start_at datetime" do
      Factory.build(:training, :start_at => nil).should be_invalid
    end

    it "should have a end_at datetime" do
      Factory.build(:training, :end_at => nil).should be_invalid
    end

    it "should have a number as default_points" do
      Factory.build(:training, :default_points => "abc").should be_invalid
    end
  end

  describe "scopes" do
    it "should order by start_at by default" do
      Training.delete_all
      training1 = Factory.create(:training, :start_at => Date.parse('2011-02-11'))
      training2 = Factory.create(:training, :start_at => Date.parse('2011-02-10'))
      Training.all.should == [training2, training1] 
    end
  end
end
