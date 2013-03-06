require 'spec_helper'

describe ReportController do
  let(:team) { mock_model(Team).as_null_object }

  describe "GET 'teams'" do
    it "returns http success" do
      get 'teams'
      response.should be_success
    end

    it "get all teams" do
      Team.should_receive(:all)
      get :teams
    end

    it "should have teams" do
      Team.stub(:all).and_return([team])
      get :teams
      assigns(:teams).should eq([team])
    end
  end
end