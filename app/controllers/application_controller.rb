class ApplicationController < ActionController::Base
  protect_from_forgery

    private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_url
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end


end
