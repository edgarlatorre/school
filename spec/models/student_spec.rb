require 'spec_helper'

describe Student do
  it "should have a name" do
    student = Student.create
    expect(student).to have(1).error_on(:name)
  end
end
