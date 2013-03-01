class Teacher < ActiveRecord::Base
  attr_accessible :age, :name
  validates_presence_of :name
end
