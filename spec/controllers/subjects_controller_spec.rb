require 'spec_helper'

describe SubjectsController do
      let(:subject) { mock_model(Subject).as_null_object }

  describe "GET 'index" do
    it "should be success"do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should list subjects" do
      Subject.stub(:all).and_return([subject])
      get :index
      assigns(:subjects).should eq([subject])
    end
  end

  describe "GET 'show" do
    before(:each) do
      Subject.stub(:find).and_return(subject)
      get :show, :id => subject.id
    end

    it "should show the subject" do
      assigns(:subject).should eq(subject)
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

    it "should instance a subject" do
      Subject.should_receive(:new)
      get :new
    end

    it "should have a subject instance" do
      Subject.stub(:new).and_return(subject)
      get :new
      assigns(:subject).should eq(subject)
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      Subject.stub(:find).and_return(subject)
      get :edit, :id => subject.id
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render edit template" do
      expect(response).to render_template("edit")
    end

    it "should have a subject instance" do
      assigns(:subject).should eq(subject)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      Subject.stub(:new).and_return(subject)
    end

    it "creates subject" do
      Subject.should_receive(:new).with("name" => "edgar").and_return(subject)
      post :create, :subject => {:name => "edgar"}
    end

    it "saves subject" do
      subject.should_receive(:save).and_return(true)
      post :create
    end

    it "show success message" do
      subject.stub(:save).and_return(true)
      post :create
      expect(flash[:notice]).to eq("Subject was successfully created.")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      Subject.stub(:find).and_return(subject)
    end

    it "updates subject" do
      subject.should_receive(:update_attributes).and_return(true)
      put :update, :id => subject.id
    end

    it "should success update message" do
      Subject.stub(:update_attributes).and_return(true)
      put :update, :id => subject.id
      expect(flash[:notice]).to eq("Subject was successfully updated.")
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Subject.stub(:find).and_return(subject)
    end

    it "deletes subject" do
      subject.should_receive(:destroy)
      delete :destroy, :id => subject.id
    end
  end
end
