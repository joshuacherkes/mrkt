class Match < ActiveRecord::Base
	attr_accessible :user_id, :job_id, :employer_id
	after_create :issue_emails

	belongs_to :user
	belongs_to :job
	belongs_to :employer



	def issue_emails
	end




end