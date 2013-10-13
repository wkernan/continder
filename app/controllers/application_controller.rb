class ApplicationController < ActionController::Base
  protect_from_forgery

private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def admin?
		request.remote_ip == "127.0.0.1"
	end
	helper_method :admin?
	helper_method :current_user
end
