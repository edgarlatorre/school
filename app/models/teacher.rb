class Teacher < ActiveRecord::Base
  attr_accessible :age, :name
  validates_presence_of :name
  has_many :lessons
end
