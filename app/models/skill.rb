class Skill < ActiveRecord::Base
	attr_accessible :title, :jobskills_attributes

	has_many :jobskills

	has_many :jobs, :through => :jobskills

	accepts_nested_attributes_for :jobskills, :reject_if => :all_blank

end