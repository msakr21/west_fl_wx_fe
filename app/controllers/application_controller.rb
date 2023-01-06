class ApplicationController < ActionController::Base
end

class ApplicationController < ActionController::Base
	before_action :check_login
	helper_method :current_user, :logged_in?
	# helper_method lets you use these in the view.

	def current_user
		# This 'if' statement does not need an 'end'. It is a guard statement. The same as 'if [thing] then [other thing] end'
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		# if using a session then '@current_user ||= User.find(session[:user_id] if session[:user_id])
	end

	def current_admin?
		current_user && current_user.admin?
	end

	def logged_in?
		current_user != nil
	end

	def check_login
		if !logged_in?
			flash[:error] = 'You must be logged in to view this content'
			redirect_to root_path
		end
	end
end