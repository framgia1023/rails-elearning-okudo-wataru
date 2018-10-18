class StaticPagesController < ApplicationController
	def home
		
	end

	def dashboard

		follow_act = Relationship.where(follower_id: current_user.id)
		followed_act = Relationship.where(followed_id: current_user.id)
		lesson_act = Lesson.where(user_id: current_user.id)
		follow_hash = follow_act.collect{|item| item.id}
		followed_hash = followed_act.collect{|item| item.id}
		lesson_hash = lesson_act.collect{|item| item.id}
		act1 = Activity.where(action_type: "Relationship",action_id: follow_hash)
		act2 = Activity.where(action_type: "Relationship",action_id: followed_hash)
		act3 = Activity.where(action_type: "Lesson",action_id: lesson_hash)

		follow_list = current_user.following.collect{|item| item.id}
		follow_act2 = Relationship.where(follower_id: follow_list)
		followed_act2 = Relationship.where(followed_id: follow_list)
		lesson_act2 = Lesson.where(user_id: follow_list)
		follow_hash2 = follow_act2.collect{|item| item.id}
		followed_hash2 = followed_act2.collect{|item| item.id}
		lesson_hash2 = lesson_act2.collect{|item| item.id}
		act4 = Activity.where(action_type: "Relationship",action_id: follow_hash2)
		act5 = Activity.where(action_type: "Relationship",action_id: followed_hash2)
		act6 = Activity.where(action_type: "Lesson",action_id: lesson_hash2)		

		activity = act1 + act2 + act3 + act4 + act5 + act6
		@activities = Activity.where(id: activity).order(created_at: :desc).paginate(page: params[:page], per_page: 6)
	end
end
