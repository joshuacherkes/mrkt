class EmployersController < ApplicationController 

  before_filter :authenticate_employer!

  def match
    @profile = Profile.find_by_sql("
      SELECT *
      FROM   profiles 
      WHERE  profiles.id NOT IN 
      (SELECT 
        profile_id 
        FROM 
        employerseenprofiles where employer_id = #{current_employer.id}
        )").first

    if @profile
      render "profiles/match_show"
    else
      render "profiles/nomore"
    end
  end


  def dashboard
    @employer = current_employer
  end
end