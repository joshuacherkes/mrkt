class EmployersController < ApplicationController 

  before_filter :authenticate_employer!

	def match
		@profile = Job.find_by_sql("
			SELECT *
			FROM   profiles 
			WHERE  profiles.id NOT IN (SELECT profile_id FROM employerseenprofiles where employer_id = #{current_employer.id})").first

		if @profile
			render "profiles/match_show"
		else
			render :nothing => true
		end

	end




end