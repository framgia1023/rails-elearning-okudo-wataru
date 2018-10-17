class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]



	def index
		# @users = User.all
		@users = User.paginate(page: params[:page], per_page: 6)
	end

	def show
		@user = User.find(params[:id])
		# @activities = Activity.paginate(page: params[:page], per_page: 6)


		if @user == current_user
			follow_act = Relationship.where(follower_id: current_user.id)
			followed_act = Relationship.where(followed_id: current_user.id)
			lesson_act = Lesson.where(user_id: current_user.id)
			follow_hash = follow_act.collect{|item| item.id}
			followed_hash = followed_act.collect{|item| item.id}
			lesson_hash = lesson_act.collect{|item| item.id}
			act1 = Activity.where(action_type: "Relationship",action_id: follow_hash)
			act2 = Activity.where(action_type: "Relationship",action_id: followed_hash)
			act3 = Activity.where(action_type: "Lesson",action_id: lesson_hash)
			activity = act1 + act2 + act3
			@activities = Activity.where(id: activity).paginate(page: params[:page], per_page: 6)


		else
			follow_act = Relationship.where(follower_id: @user.id)
			followed_act = Relationship.where(followed_id: @user.id)
			lesson_act = Lesson.where(user_id: @user.id)
			follow_hash = follow_act.collect{|item| item.id}
			followed_hash = followed_act.collect{|item| item.id}
			lesson_hash = lesson_act.collect{|item| item.id}
			act1 = Activity.where(action_type: "Relationship",action_id: follow_hash)
			act2 = Activity.where(action_type: "Relationship",action_id: followed_hash)
			act3 = Activity.where(action_type: "Lesson",action_id: lesson_hash)
			activity = act1 + act2 + act3
			@activities = Activity.where(id: activity).paginate(page: params[:page], per_page: 6)

		end			

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
