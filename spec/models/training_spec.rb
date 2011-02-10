require 'spec_helper'

describe Training do
  describe "validations" do
    it "should have a person" do
      Factory.build(:training, :person => nil).should be_invalid
    end

    it "should have a number as default_points" do
      Factory.build(:training, :default_points => "abc").should be_invalid
    end
  end
end
