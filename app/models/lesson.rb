class Lesson < ActiveRecord::Base
  has_one :teacher
  has_one :subject
  belongs_to :team
  validates_presence_of :teacher, :subject
end
