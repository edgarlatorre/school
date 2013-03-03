class Student < ActiveRecord::Base
  attr_accessible :age, :name, :team_id
  validates_presence_of :name, :team
  belongs_to :team
end
