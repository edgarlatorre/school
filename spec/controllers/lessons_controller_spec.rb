require 'spec_helper'

describe LessonsController do
  let(:lesson) { mock_model(Lesson).as_null_object }

  describe "GET 'index" do
    it "should be success"do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should list lessons" do
      Lesson.stub(:all).and_return([lesson])
      get :index
      assigns(:lessons).should eq([lesson])
    end
  end

  describe "GET 'show" do
    before(:each) do
      Lesson.stub(:find).and_return(lesson)
      get :show, :id => lesson.id
    end

    it "should show the lesson" do
      assigns(:lesson).should eq(lesson)
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

    it "should instance a lesson" do
      Lesson.should_receive(:new)
      get :new
    end

    it "should have a lesson instance" do
      Lesson.stub(:new).and_return(lesson)
      get :new
      assigns(:lesson).should eq(lesson)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      Lesson.stub(:new).and_return(lesson)
    end

    it "creates lesson" do
      Lesson.should_receive(:new).and_return(lesson)
      post :create, :lesson => {:team_id => "1"}
    end

    it "saves lesson" do
      lesson.should_receive(:save).and_return(true)
      post :create
    end

    it "show success message" do
      lesson.stub(:save).and_return(true)
      post :create
      expect(flash[:notice]).to eq("Aula criada com sucesso.")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      Lesson.stub(:find).and_return(lesson)
    end

    it "updates lesson" do
      lesson.should_receive(:update_attributes).and_return(true)
      put :update, :id => lesson.id
    end

    it "should success update message" do
      Lesson.stub(:update_attributes).and_return(true)
      put :update, :id => lesson.id
      expect(flash[:notice]).to eq("Aula atualizada com sucesso.")
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Lesson.stub(:find).and_return(lesson)
    end

    it "deletes team" do
      lesson.should_receive(:destroy)
      delete :destroy, :id => lesson.id
    end
  end

end
