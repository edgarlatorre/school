class Lesson < ActiveRecord::Base
  attr_accessible :team_id, :teacher_id, :subject_id
  belongs_to :team
  belongs_to :teacher
  belongs_to :subject
  validates_presence_of :team, :teacher, :subject
end
