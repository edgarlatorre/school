require 'spec_helper'

describe Teacher do
  it "should have a name" do
    teacher = Teacher.create
    expect(teacher).to have(1).error_on(:name)
  end
end
