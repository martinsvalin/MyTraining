require 'spec_helper'

describe Authorization do
  describe "validations" do
    it "should have a person" do
      Factory.build(:authorization, :person => nil).should be_invalid
    end

    it "should have a uid" do
      Factory.build(:authorization, :uid => nil).should be_invalid
    end

    it "should have a provider" do
      Factory.build(:authorization, :provider => nil).should be_invalid
    end
  end
end
