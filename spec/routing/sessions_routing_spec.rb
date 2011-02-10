require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "recognizes and generates #create" do
      { :post => "/auth/google_apps/callback" }.should route_to(:controller => "sessions", :action => "create")
    end
  end
end
