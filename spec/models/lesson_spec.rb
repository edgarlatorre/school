require 'spec_helper'

describe Lesson do
  it "should have a teacher" do
    lesson = Lesson.create
    expect(lesson).to have(1).error_on(:teacher)
  end

  it "should have a subject" do
    lesson = Lesson.create
    expect(lesson).to have(1).error_on(:subject)
  end

  it "should belongs to a team" do
    lesson = Lesson.create
    expect(lesson).to have(1).error_on(:team)
  end
end
