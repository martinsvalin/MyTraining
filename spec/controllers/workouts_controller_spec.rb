require 'spec_helper'

describe WorkoutsController do
  before(:all) do
    @training = Factory.create(:training)
    @workout = @training.workouts.new
  end

  describe "POST create" do
    it "assigns a newly created workout as @workout" do
      Workout.expects(:new).with(params).returns @workout
      post :create, :workout => params
      assigns(:workout).should be @workout
    end

    describe "with valid params" do
      it "saves the workout to the database" do
        lambda {
          post :create, :workout => params
        }.should change{Workout.count}
      end

      it "redirects to trainings list with success notice" do
        Workout.expects(:new).returns @workout
        @workout.expects(:save).returns true
        post :create, :workout => params
        response.should redirect_to(trainings_path)
        flash[:notice].should be_present
      end
    end

    describe "with invalid params" do
      it "doesn't save the workout to the database" do
        lambda {
          post :create, :workout => params.merge({"person_id" => nil}) # person is required
        }.should_not change{Workout.count}
      end

      it "redirects to trainings list with failure warning" do
        Workout.expects(:new).returns @workout
        @workout.expects(:save).returns false
        post :create, :workout => params.merge({"person_id" => nil}) # person is required
        response.should redirect_to(trainings_path)
        flash[:alert].should be_present
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workout" do
      Workout.expects(:find).with("37").returns @workout
      @workout.expects(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the trainings list" do
      Workout.expects(:find).returns @workout
      delete :destroy, :id => "1"
      response.should redirect_to(trainings_path)
    end
  end

  def params
    {
      "training_id" => @training.id.to_s,
      "person_id" => "1"
    }
  end
end
