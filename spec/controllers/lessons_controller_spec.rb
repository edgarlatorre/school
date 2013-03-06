require 'spec_helper'

describe LessonsController do
  let(:lesson) { mock_model(Lesson).as_null_object }

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
