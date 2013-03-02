require 'spec_helper'

describe Subject do
  it "should have a name" do
    subject = Subject.create
    expect(subject).to have(1).error_on(:name)
  end
end
