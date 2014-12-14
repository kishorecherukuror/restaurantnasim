class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   def after_sign_in_path_for(resource)
    "/show_map"
  end
private
	
	def current_user
		@current_user ||= TwitterUser.find(session[:t_user_id]) if session[:t_user_id]
	end
	helper_method :current_user
end
