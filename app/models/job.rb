class Job < ActiveRecord::Base
	attr_accessible :employer_id, :team_name, :description, 
	:team_photo, :skills_attributes, :skill_ids, :filepicker_url

	validates :team_name, :description, :presence => true

	has_attached_file :team_photo, :styles => {
		:medium => "300x300>", 
		:thumb => "100x100>"
	}

	belongs_to :employer

	has_many :jobskills

	has_many :skills, :through => :jobskills

	accepts_nested_attributes_for :skills, :reject_if => :all_blank

	# def skills_attributes=(attributes)
 #    # Process the attributes hash
	# end

end