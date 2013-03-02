require 'spec_helper'

describe Team do
  it "should have a name" do
    team = Team.create
    expect(team).to have(1).error_on(:name)
  end
end
