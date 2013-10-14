class ApplicationController < ActionController::Base
  protect_from_forgery

private
	def admin?
		request.remote_ip == "99.89.189.74"
	end
	helper_method :admin?
end
