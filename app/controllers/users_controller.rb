class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]

	@@indexnum = 0

	def index
		@users = User.paginate(page: params[:page], per_page: 9)
	end

	def next
		@click_id = params[:click_id]
		@user = User.find(params[:now_id])
		@prev = User.find(params[:prev_id])
		# @user = User.find[:now_id]
		respond_to do |format|
	    	format.html
	   		format.js
	  	end
	end

	def prev
		@click_id = params[:click_id]
		@user = User.find(params[:now_id])

		respond_to do |format|
			format.html
			format.js
		end
	end


	def show
		@user = User.find(params[:id])
		@activities = Activity.where(id: act_list(@user.id)).order(created_at: :desc).paginate(page: params[:page], per_page: 6)

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
			params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
		end

		def require_login
			unless logged_in?
				redirect_to login_url #/login				
			end
		end

end
