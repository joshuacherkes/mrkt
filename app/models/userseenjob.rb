class Userseenjob < ActiveRecord::Base

	# after_create :check_if_match, :if => "user_likes_job?"

  attr_accessible :user_id, :job_id, :isliked


  belongs_to :user
  belongs_to :job


  private

  	def check_if_match
  		employer = self.job.employer
  		employer_likes_array = employer.employerseenprofiles.where({
  			profile_id: self.profile.id, 
  			employer_id: employer.id,
  			isliked: true
  			})
  		#if our profile is in thier likes....(for this job??)
  		if !employer_likes_array.empty?
  			#match model will be responsible for sending emails 
  			Match.create!({
  				user_id: self.user_id,
  				job_id: self.job_id,
  				employer_id: employer.id
  				})
  		end
  	end


  	def user_likes_job?
  		self.isliked
  	end
  




end