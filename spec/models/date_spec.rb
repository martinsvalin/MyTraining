require 'spec_helper'

describe Date do
  before(:each) do
    Date.stub(:today).and_return(Date.parse("Feb 10, 2011"))
  end

  describe "self.from_week_within_six_months" do
    it "should return a date from a week number" do
      Date.from_week_within_six_months(20).should be_an_instance_of Date
    end

    it "should return the first date in the week specified" do
      Date.from_week_within_six_months(Date.today.cweek).should == Date.today.beginning_of_week
    end

    it "should return a date in the previous year if the week is more than six months in the future" do
      Date.from_week_within_six_months(52).year.should == 2010
    end

    it "should return a date in the correct week when getting a date in the previous year" do
      Date.from_week_within_six_months(52).cweek.should == 52
    end
  end
end
