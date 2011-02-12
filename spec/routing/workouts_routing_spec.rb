require "spec_helper"

describe WorkoutsController do
  describe "routing" do

    it "recognizes and generates #create" do
      { :post => "/workouts" }.should route_to(:controller => "workouts", :action => "create")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/workouts/1" }.should route_to(:controller => "workouts", :action => "destroy", :id => "1")
    end

  end
end
