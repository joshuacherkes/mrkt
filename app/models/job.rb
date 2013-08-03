class Job < ActiveRecord::Base
	attr_accessible :employer_id, :team_name, :description, :team_photo, :skills_attributes, :skill_ids 

	validates :team_name, :description, :presence => true

	belongs_to :employer

	has_many :jobskills

	has_many :skills, :through => :jobskills

	accepts_nested_attributes_for :skills, :reject_if => :all_blank

	# def skills_attributes=(attributes)
 #    # Process the attributes hash
	# end

end