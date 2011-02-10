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

    it "should have unique uid for a provider" do
      Factory.create(:authorization, :uid => "qwerty", :provider => 'twitter')
      Factory.build(:authorization, :uid => "qwerty", :provider => 'twitter').should be_invalid
    end

    it "should not require uid to be unique for different providers" do
      Factory.create(:authorization, :uid => "qwerty", :provider => 'twitter')
      Factory.build(:authorization, :uid => "qwerty", :provider => 'facebook').should be_valid
    end
  end
end
