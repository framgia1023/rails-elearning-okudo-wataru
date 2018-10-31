module UsersHelper

	def show_avator(user)
		if user.image?
			image_tag("#{user.image}")
		else
			image_tag("/avator1.png")
		end
	end

	def act_log(act, type)
		if type == "follow" || type == "follow_path"
			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)
			name = follower.name
			path = follower.id
			if follower == current_user
				name = "You"
			end

		elsif type == "followed" || type == "followed_path"
			rela = Relationship.find(act.action_id)
			followed = User.find(rela.followed_id)
			name = followed.name
			path = followed.id
			if followed == current_user
				name = "You"
			end

		elsif type == "explorer" || type == "explorer_path"
			lesson = Lesson.find(act.action_id)
			explorer = User.find(lesson.user_id)
			name = explorer.name
			path = explorer.id
			if current_user == explorer
				name = "You"	
			end

		elsif type == "lesson" || type == "lesson_path"
			lesson = Lesson.find(act.action_id)
			cat = Category.find(lesson.category_id)
			name = cat.title
			path = lesson.id
		end
		if type == "follow_path" || type == "followed_path" || type == "explorer_path" || type == "lesson_path"
			path
		else
			name
		end
	end

	def show_man(act)
		if act.action_type == "Relationship"

			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)

			image_tag("#{follower.image}", class: "dash_avator")

		elsif act.action_type == "Lesson"

			les = Lesson.find(act.action_id)
			explorer = User.find(les.user_id)

			image_tag("#{explorer.image}", class: "dash_avator")
		end
	end

	def count_defeat(act)
		lesson = Lesson.find(act.action_id)
		correct_num = lesson.choices.collect{|i| i.correct || nil}.compact.size
		all_num = lesson.words.size

		"defeat #{correct_num}/#{all_num} enemies"
	end

	def check_clear(act)
		lesson = Lesson.find(act.action_id)
		if Lesson.exists?(category_id: lesson.category_id, user_id: current_user.id)
			return true
		else
			return false
		end
	end

	def act_list(user_id)
		follow_act = Relationship.where(follower_id: user_id)
		followed_act = Relationship.where(followed_id: user_id)
		lesson_act = Lesson.where(user_id: user_id)
		follow_hash = follow_act.collect{|item| item.id}
		followed_hash = followed_act.collect{|item| item.id}
		lesson_hash = lesson_act.collect{|item| item.id}
		act1 = Activity.where(action_type: "Relationship",action_id: follow_hash)
		act2 = Activity.where(action_type: "Relationship",action_id: followed_hash)
		act3 = Activity.where(action_type: "Lesson",action_id: lesson_hash)	

		activity = act1 + act2 + act3
	end

end

