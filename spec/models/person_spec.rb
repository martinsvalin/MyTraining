require 'spec_helper'

describe Person do
  describe "validations" do
    before do
      @valid_person = Factory.build(:person)
    end

    it "should work" do
      @valid_person.should be_valid
    end

    it "should have a name" do
      @valid_person.name = nil
      @valid_person.should be_invalid
    end
  end
end
