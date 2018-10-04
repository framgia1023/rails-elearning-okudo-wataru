module SessionsHelper

	def current_user
		User.find_by(id: session[:user_id])
	end

	def current_user?(user)
		current_user == user
	end

	def logged_in?
		!current_user.nil?
	end
end
