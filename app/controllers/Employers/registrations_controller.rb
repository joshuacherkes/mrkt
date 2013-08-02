class Employers::RegistrationsController < Devise::RegistrationsController
	def new
		@employer = Employer.new
		render "employer/registrations/new"
	end

    def after_sign_up_path_for(employer)
    	new_job_url
    end
    
    def after_sign_in_path_for(employer)
		jobs_url
	end



end
