require 'spec_helper'

describe TrainingsController do
  before(:each) do
    login
    @training = Training.new
  end

  describe "GET index" do
    it "assigns some trainings as @trainings" do
      Training.expects(:in_week).returns [@training]
      get :index
      assigns(:trainings).should == [@training]
    end

    describe "without params" do
      it "assigns this week number to @week" do
        Date.expects(:today).at_least_once.returns Date.parse "2011-02-17" # 2011-02-17 is in week 7
        get :index
        assigns(:week).should == 7
      end
    end

    describe "with a week param" do
      it "assigns the requested week to @week" do
        get :index, :week => "16"
        assigns(:week).should == 16
      end
    end
  end

  describe "GET new" do
    it "assigns a new training as @training" do
      Training.expects(:new).returns @training
      get :new
      assigns(:training).should be @training
    end
  end

  describe "GET edit" do
    it "assigns the requested training as @training" do
      Person.any_instance.stubs(:trainings).returns Training
      Training.expects(:find).with("37").returns @training
      get :edit, :id => "37"
      assigns(:training).should be @training
    end
  end

  describe "POST create" do
    it "assigns a newly created training as @training" do
      Training.expects(:new).returns @training
      post :create, :training => params
      assigns(:training).should be @training
    end

    describe "with valid params" do
      it "saves the training to the database" do
        lambda {
          post :create, :training => params
        }.should change{Training.count}
      end

      it "redirects back to trainings path after successful create" do
        Training.expects(:new).returns @training
        @training.expects(:save).returns true
        post :create, :training => params
        response.should redirect_to trainings_path
      end
    end

    describe "with invalid params" do
      it "doesn't save the training to the database" do
        lambda {
          post :create, :training => params.merge({:title => nil}) # title is required
        }.should_not change{ Training.count }
      end

      it "re-renders the 'new' template" do
        Training.expects(:new).returns @training
        @training.expects(:save).returns false
        post :create, :training => params.merge({:title => nil}) # title is required
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    before(:each) do
      Person.any_instance.stubs(:trainings).returns Training
    end

    it "assigns the requested training as @training" do
      Training.expects(:find).returns @training
      put :update, :id => "1", :training => params
      assigns(:training).should be @training
    end

    describe "with valid params" do
      it "updates the requested training" do
        Training.expects(:find).with("37").returns @training
        @training.expects(:update_attributes).with(params_after_filters)
        put :update, :id => "37", :training => params
      end

      it "redirects to the training" do
        Training.expects(:find).returns @training
        put :update, :id => "1", :training => params
        response.should redirect_to trainings_path
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        Training.expects(:find).returns @training
        put :update, :id => "1", :training => params.merge({:title => nil}) # title is required
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
      Person.any_instance.stubs(:trainings).returns Training
    end

    it "destroys the requested training" do
      Training.expects(:find).with("37").returns @training
      @training.expects :destroy
      delete :destroy, :id => "37"
    end

    it "redirects to the trainings list" do
      Training.expects(:find).returns @training
      delete :destroy, :id => "1"
      response.should redirect_to trainings_path
    end
  end

  describe "before filters" do
    describe "get current user or redirect to login" do
      it "should redirect if not logged in" do
        Person.stubs(:find_by_id).returns nil
        get :index
        response.should be_redirect
      end
    end

    describe "assign start_at" do
      it "should set start_at from start_date and start_time" do
        pending
        ActionController::Base.any_instance.stubs(:params).returns params
        controller.instance_eval{assign_start_at}.should == params_after_filters
      end

      it "should set end_at from start_at and duration" do
        pending
      end

      it "should remove start_date, start_time and duration from params" do
        pending
      end
    end
  end

  def login
    Person.stubs(:find_by_id).returns Factory.create :person
  end

  def params
    {
      :location => "Mynewsdesk",
      :title => "Fighting",
      :duration => "60",
      :start_date => "2011-02-11",
      :start_time => "09:00"
    }
  end

  def params_after_filters
    {
      'location' => 'Mynewsdesk',
      'title' => 'Fighting',
      'end_at' => DateTime.parse("Fri, 11 Feb 2011 10:00:00 CET +01:00"),
      'start_at' => DateTime.parse("Fri, 11 Feb 2011 09:00:00 CET +01:00")
    }
  end
end
