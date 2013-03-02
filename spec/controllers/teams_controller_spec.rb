require 'spec_helper'

describe TeamsController do
  let(:team) { mock_model(Team).as_null_object }

  describe "GET 'index" do
    it "should be success"do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should list teams" do
      Team.stub(:all).and_return([team])
      get :index
      assigns(:teams).should eq([team])
    end
  end

  describe "GET 'show" do
    before(:each) do
      Team.stub(:find).and_return(team)
      get :show, :id => team.id
    end

    it "should show the team" do
      assigns(:team).should eq(team)
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

    it "should instance a team" do
      Team.should_receive(:new)
      get :new
    end

    it "should have a team instance" do
      Team.stub(:new).and_return(team)
      get :new
      assigns(:team).should eq(team)
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      Team.stub(:find).and_return(team)
      get :edit, :id => team.id
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render edit template" do
      expect(response).to render_template("edit")
    end

    it "should have a team instance" do
      assigns(:team).should eq(team)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      Team.stub(:new).and_return(team)
    end

    it "creates team" do
      Team.should_receive(:new).with("name" => "edgar").and_return(team)
      post :create, :team => {:name => "edgar"}
    end

    it "saves team" do
      team.should_receive(:save).and_return(true)
      post :create
    end

    it "show success message" do
      team.stub(:save).and_return(true)
      post :create
      expect(flash[:notice]).to eq("Team was successfully created.")
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      Team.stub(:find).and_return(team)
    end

    it "updates team" do
      team.should_receive(:update_attributes).and_return(true)
      put :update, :id => team.id
    end

    it "should success update message" do
      Team.stub(:update_attributes).and_return(true)
      put :update, :id => team.id
      expect(flash[:notice]).to eq("Team was successfully updated.")
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      Team.stub(:find).and_return(team)
    end

    it "deletes team" do
      team.should_receive(:destroy)
      delete :destroy, :id => team.id
    end
  end
end
