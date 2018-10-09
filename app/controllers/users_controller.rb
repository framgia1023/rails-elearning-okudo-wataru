class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]



	def index
		# @users = User.all
		@users = User.all.paginate(page: params[:page], per_page: 3)
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if
			@user.update_attributes(user_params)
			flash[:success] = "SUCCESS EDIT"
			redirect_to user_url
		else
			render "edit"
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_url
		flash[:danger] = "success deleted"
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Success Signup"
			redirect_to root_url
		else
			render "new"
		end
	end	
	
	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def require_login
			unless logged_in?
				redirect_to login_url #/login				
			end
		end

end
