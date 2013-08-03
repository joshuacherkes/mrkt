class Skill < ActiveRecord::Base
	attr_accessible :title

	has_many :jobskills

	has_many :jobs, :through => :jobskills



end