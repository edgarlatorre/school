require 'spec_helper'

describe TeachersController do
  let(:teacher) { mock_model(Teacher).as_null_object }

  describe "GET 'index" do
    it "should be success"do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should list teachers" do
      Teacher.stub(:all).and_return([teacher])
      get :index
      assigns(:teachers).should eq([teacher])
    end
  end

  describe "GET 'show" do
    before(:each) do
      Teacher.stub(:find).and_return(teacher)
      get :show, :id => teacher.id
    end

    it "should show the teacher" do
      assigns(:teacher).should eq(teacher)
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

    it "should instance a teacher" do
      Teacher.should_receive(:new)
      get :new
    end

    it "should have a teacher instance" do
      Teacher.stub(:new).and_return(teacher)
      get :new
      assigns(:teacher).should eq(teacher)
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      Teacher.stub(:find).and_return(teacher)
      get :edit, :id => teacher.id
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render edit template" do
      expect(response).to render_template("edit")
    end

    it "should have a teacher instance" do
      assigns(:teacher).should eq(teacher)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      Teacher.stub(:new).and_return(teacher)
    end

    it "creates teacher" do
      Teacher.should_receive(:new).with("name" => "edgar").and_return(teacher)
      post :create, :teacher => {:name => "edgar"}
    end

    it "saves teacher" do
      teacher.should_receive(:save).and_return(true)
      post :create
    end

    it "show success message" do
      teacher.stub(:save).and_return(true)
      post :create
      expect(flash[:notice]).to eq("Teacher was successfully created.")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      Teacher.stub(:find).and_return(teacher)
    end

    it "updates teacher" do
      teacher.should_receive(:update_attributes).and_return(true)
      put :update, :id => teacher.id
    end

    it "should success update message" do
      Teacher.stub(:update_attributes).and_return(true)
      put :update, :id => teacher.id
      expect(flash[:notice]).to eq("Teacher was successfully updated.")
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Teacher.stub(:find).and_return(teacher)
    end

    it "deletes teacher" do
      teacher.should_receive(:destroy)
      delete :destroy, :id => teacher.id
    end
  end
end
