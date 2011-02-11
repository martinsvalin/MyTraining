require 'spec_helper'

describe PeopleController do
  before(:all) do
    @person = Person.new
  end

  describe "GET index" do
    it "assigns all people as @people" do
      Person.expects(:all).returns [@person]
      get :index
      assigns(:people).should == [@person]
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      Person.expects(:find).with("37").returns @person
      get :show, :id => "37"
      assigns(:person).should be @person
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      Person.expects(:new).returns @person
      get :new
      assigns(:person).should be @person
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      Person.expects(:find).with("37").returns @person
      get :edit, :id => "37"
      assigns(:person).should be @person
    end
  end

  describe "POST create" do
    it "assigns a newly created person as @person" do
      Person.expects(:new).with({'name' => 'Alfred'}).returns @person
      post :create, :person => {'name' => 'Alfred'}
      assigns(:person).should be @person
    end

    describe "with valid params" do
      it "redirects to the created person" do
        person = Factory.create :person
        Person.expects(:new).returns person
        post :create, :person => {}
        response.should redirect_to(person_url person)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        Person.expects(:new).returns @person
        @person.expects(:save).returns(false)
        post :create, :person => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    it "assigns the requested person as @person" do
      Person.expects(:find).returns @person
      @person.expects(:update_attributes).returns true
      put :update, :id => "1"
      assigns(:person).should be @person
    end

    describe "with valid params" do
      it "updates the requested person" do
        Person.expects(:find).with('37').returns @person
        @person.expects(:update_attributes).with({'name' => 'Albert'})
        put :update, :id => "37", :person => {'name' => 'Albert'}
      end

      it "redirects to the person" do
        person = Factory.create :person
        Person.expects(:find).returns person
        put :update, :id => "1"
        response.should redirect_to(person_url person)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        Person.expects(:find).returns @person
        @person.expects(:update_attributes).returns false
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      Person.expects(:find).with('37').returns @person
      @person.expects :destroy
      delete :destroy, :id => "37"
    end

    it "redirects to the people list" do
      Person.expects(:find).returns @person
      delete :destroy, :id => "1"
      response.should redirect_to(people_url)
    end
  end
end
