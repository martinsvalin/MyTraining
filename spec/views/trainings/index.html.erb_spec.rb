require 'spec_helper'

describe "trainings/index.html.erb" do
  before(:each) do
    stub_current_user
    @week = 6
    @trainings = [Factory.create(:training), Factory.create(:training)]
  end
  it "renders a list of trainings" do
    render
    assert_select "article>header>h1", :text => @trainings.first.title
    assert_select "article>div.training>span", :text => @trainings.first.location
  end

  def stub_current_user
    ActionView::Base.any_instance.stubs(:current_user).returns Factory.create :person
  end
end
