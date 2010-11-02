require 'spec_helper'

describe TrainingsController do

  def mock_training(stubs={})
    (@mock_training ||= mock_model(Training).as_null_object).tap do |training|
      training.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all trainings as @trainings" do
      Training.stub(:all) { [mock_training] }
      get :index
      assigns(:trainings).should eq([mock_training])
    end
  end

  describe "GET show" do
    it "assigns the requested training as @training" do
      Training.stub(:find).with("37") { mock_training }
      get :show, :id => "37"
      assigns(:training).should be(mock_training)
    end
  end

  describe "GET new" do
    it "assigns a new training as @training" do
      Training.stub(:new) { mock_training }
      get :new
      assigns(:training).should be(mock_training)
    end
  end

  describe "GET edit" do
    it "assigns the requested training as @training" do
      Training.stub(:find).with("37") { mock_training }
      get :edit, :id => "37"
      assigns(:training).should be(mock_training)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created training as @training" do
        Training.stub(:new).with({'these' => 'params'}) { mock_training(:save => true) }
        post :create, :training => {'these' => 'params'}
        assigns(:training).should be(mock_training)
      end

      it "redirects to the created training" do
        Training.stub(:new) { mock_training(:save => true) }
        post :create, :training => {}
        response.should redirect_to(training_url(mock_training))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved training as @training" do
        Training.stub(:new).with({'these' => 'params'}) { mock_training(:save => false) }
        post :create, :training => {'these' => 'params'}
        assigns(:training).should be(mock_training)
      end

      it "re-renders the 'new' template" do
        Training.stub(:new) { mock_training(:save => false) }
        post :create, :training => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested training" do
        Training.should_receive(:find).with("37") { mock_training }
        mock_training.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :training => {'these' => 'params'}
      end

      it "assigns the requested training as @training" do
        Training.stub(:find) { mock_training(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:training).should be(mock_training)
      end

      it "redirects to the training" do
        Training.stub(:find) { mock_training(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(training_url(mock_training))
      end
    end

    describe "with invalid params" do
      it "assigns the training as @training" do
        Training.stub(:find) { mock_training(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:training).should be(mock_training)
      end

      it "re-renders the 'edit' template" do
        Training.stub(:find) { mock_training(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested training" do
      Training.should_receive(:find).with("37") { mock_training }
      mock_training.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the trainings list" do
      Training.stub(:find) { mock_training }
      delete :destroy, :id => "1"
      response.should redirect_to(trainings_url)
    end
  end

end
