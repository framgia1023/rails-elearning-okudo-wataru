class UsersController < ApplicationController


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

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Success Login"
			redirect_to root_url
		else
			flash[:danger] = "Failed"
			render "new"
		end
	end


	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
