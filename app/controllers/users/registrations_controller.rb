class Users::RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
		render "users/registrations/new"
	end

    def after_sign_up_path_for(user)
    	new_profile_url
    end
    
    def after_sign_in_path_for(user)
		profile_url(user)
	end



end
