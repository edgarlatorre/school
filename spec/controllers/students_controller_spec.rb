require 'spec_helper'

describe StudentsController do
  let(:student) { mock_model(Student).as_null_object }

  describe "GET 'index" do
    it "should be success"do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should list students" do
      Student.stub(:all).and_return([student])
      get :index
      assigns(:students).should eq([student])
    end
  end

  describe "GET 'show" do
    before(:each) do
      Student.stub(:find).and_return(student)
      get :show, :id => student.id
    end

    it "should show the student" do
      assigns(:student).should eq(student)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET 'new'" do
    it "should be success" do
      get :new
      expect(response).to be_success
    end

    it "should instance a student" do
      Student.should_receive(:new)
      get :new
    end

    it "should have a student instance" do
      Student.stub(:new).and_return(student)
      get :new
      assigns(:student).should eq(student)
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      Student.stub(:find).and_return(student)
      get :edit, :id => student.id
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render edit template" do
      expect(response).to render_template("edit")
    end

    it "should have a student instance" do
      assigns(:student).should eq(student)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      Student.stub(:new).and_return(student)
    end

    it "creates student" do
      Student.should_receive(:new).with("name" => "edgar").and_return(student)
      post :create, :student => {:name => "edgar"}
    end

    it "saves student" do
      student.should_receive(:save).and_return(true)
      post :create
    end

    it "show success message" do
      student.stub(:save).and_return(true)
      post :create
      expect(flash[:notice]).to eq("Student was successfully created.")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      Student.stub(:find).and_return(student)
    end

    it "updates student" do
      student.should_receive(:update_attributes).and_return(true)
      put :update, :id => student.id
    end

    it "should success update message" do
      Student.stub(:update_attributes).and_return(true)
      put :update, :id => student.id
      expect(flash[:notice]).to eq("Student was successfully updated.")
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Student.stub(:find).and_return(student)
    end

    it "deletes student" do
      student.should_receive(:destroy)
      delete :destroy, :id => student.id
    end
  end
end
