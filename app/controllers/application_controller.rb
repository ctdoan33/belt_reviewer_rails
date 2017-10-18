class ApplicationController < ActionController::Base
	before_action :require_login
	protect_from_forgery with: :exception
	def current_user
		User.find(session[:id]) if session[:id]
	end
	helper_method :current_user

	private
	def require_login
		unless session[:id]
			redirect_to "/"
		end
	end
end
