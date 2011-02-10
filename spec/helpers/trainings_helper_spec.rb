require 'spec_helper'

describe TrainingsHelper do
  describe "week helpers" do
    before do
      @week = 6
    end

    it "gives me the previous week" do
      helper.previous_week.should == 5
    end

    it "gives me the next week" do
      helper.next_week.should == 7
    end

    it "gives correct previous week at start of year" do
      @week = 1
      helper.previous_week.should == 52
    end

    it "gives correct next week at end of year" do
      @week = 52
      helper.next_week.should == 1
    end
  end

  describe "training_article_class" do
    before do
      @training = Factory.create(:training)
      ActionView::Base.any_instance.stubs(:current_user).returns(Factory.build(:person))
    end
    it "sets the element class to 'your' for trainings that belong to you" do
      ActionView::Base.any_instance.stubs(:current_user).returns(@training.person)
      helper.training_article_class(@training).should == 'your'
    end

    it "sets the element class to 'other' for trainings that belong to another person" do
      helper.training_article_class(@training).should == 'other'
    end

    it "sets the element class to 'everyone' for trainings what belong to no person" do
      training = Factory.create(:training, :person => nil)
      helper.training_article_class(training).should == 'everyone'
    end
  end
end
