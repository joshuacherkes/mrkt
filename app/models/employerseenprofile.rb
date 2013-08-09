class Employerseenprofile < ActiveRecord::Base

	after_create :check_if_match, :if => "employer_likes_user?"

  attr_accessible :employer_id, :profile_id, :isliked


  belongs_to :employer
  belongs_to :profile


  private

  	def check_if_match
  		user = self.profile.user
  		user_likes_array = user.userseenjobs.where({
  			user_id: user.id, 
  			job_id: self.employer.job.id,
  			isliked: true
  			})

  		if !user_likes_array.empty?
  			#match model will be responsible for sending emails 
  			Match.create!({
  				user_id: user.id,
  				job_id: self.employer.job.id,
  				employer_id: self.employer_idt
  				})
  		end
  	end


  	def employer_likes_user?
  		self.isliked
  	end
  




end