class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    render "users/registrations/new"
  end

    def after_sign_up_path_for(user)
      new_profile_path
    end
    
    def after_sign_in_path_for(user)
      match_user_url
    end

    def create
      build_resource(sign_up_params)

      if resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(resource_name, resource)
          redirect_to after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          redirect_to after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        respond_with resource
      end
  end



end
