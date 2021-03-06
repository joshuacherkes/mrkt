class Employerseenprofile < ActiveRecord::Base

	after_create :check_if_match, :if => "employer_likes_user?"

  attr_accessible :employer_id, :profile_id, :isliked


  belongs_to :employer
  belongs_to :profile


  private

  	def check_if_match
      employer = self.employer
      user_likes_array = Userseenjob.find_by_sql("
      SELECT *
      FROM   userseenjobs 
      WHERE  user_id = #{self.profile.user.id} AND job_id IN 
      (SELECT 
        job_id
        FROM 
        jobs
        where
        employer_id = #{employer_id}
        )")

  		if !user_likes_array.empty?
  			#match model will be responsible for sending emails 
  			Match.create!({
  				user_id: self.profile.user.id,
  				job_id: user_likes_array.first.job.id,
  				employer_id: self.employer_id
  				})
  		end
  	end


  	def employer_likes_user?
  		self.isliked
  	end


end