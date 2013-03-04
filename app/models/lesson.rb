class Lesson < ActiveRecord::Base
  has_one :teacher
  has_one :subject
  validates_presence_of :teacher, :subject
end
