class InitialController < ApplicationController 

  def start
  	if current_user
  		redirect_to "/user/dashboard"
  	elsif current_employer
  		redirect_to "/employer/dashboard"
  	else
  		render :start
  	end
  end
end
