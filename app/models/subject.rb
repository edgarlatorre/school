class Subject < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :lesson
  validates_presence_of :name
end
