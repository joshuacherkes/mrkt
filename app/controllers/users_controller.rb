class UsersController < ApplicationController 
  before_filter :authenticate_user!

	def match
		@job = Job.find_by_sql("
			SELECT *
			FROM   jobs 
			WHERE  jobs.id NOT IN (SELECT job_id FROM userseenjobs where user_id = #{current_user.id})").first
		#need to get a job
		#where am I getting a job from?
		if @job
			render "jobs/match_show"
		else
			render :nothing => true
		end

	end




end