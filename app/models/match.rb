class Match < ActiveRecord::Base
	attr_accessible :user_id, :job_id, :employer_id
	after_create :issue_emails

	belongs_to :user
	belongs_to :job
	belongs_to :employer


	private

	def issue_emails
		notify_employer
		notify_user 
	end

	def notify_employer
		user = self.user
		employer = self.employer
		msg = MatchMailer.from_user_to_employer(user, employer)
		msg.deliver!
	end

	def notify_user
		user = self.user
		employer = self.employer
		msg = MatchMailer.from_employer_to_user(employer, user)
		msg.deliver!
	end




end