class StaticPagesController < ApplicationController
	def home
		
	end

	def dashboard
		
		follow_list = current_user.following.collect{|item| item.id}
		activity = act_list(current_user.id) + act_list(follow_list)
		@activities = Activity.where(id: activity).order(created_at: :desc).paginate(page: params[:page], per_page: 6)

	end

end