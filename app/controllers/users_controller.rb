class UsersController < ApplicationController


	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Success Login"
			redirect_to root_url
		else
			render "users/new"
		end
	end


	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
