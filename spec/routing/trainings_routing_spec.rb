require "spec_helper"

describe TrainingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/trainings" }.should route_to(:controller => "trainings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/trainings/new" }.should route_to(:controller => "trainings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/trainings/1" }.should route_to(:controller => "trainings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/trainings/1/edit" }.should route_to(:controller => "trainings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/trainings" }.should route_to(:controller => "trainings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/trainings/1" }.should route_to(:controller => "trainings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/trainings/1" }.should route_to(:controller => "trainings", :action => "destroy", :id => "1")
    end

  end
end
