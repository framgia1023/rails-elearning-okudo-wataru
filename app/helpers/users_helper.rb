module UsersHelper

	def show_avator(user)
		if user.image?
			image_tag("#{user.image}")
		else
			image_tag("/avator1.png")
		end
	end

	def activity_log(act)
		if act.action_type == "Relationship"

			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)
			followed = User.find(rela.followed_id)

			# if current_user.following?(follower) || current_user.following?(followed) || current_user == follower || current_user == followed
			flwname = follower.name
			flwdname = followed.name

			if follower == current_user
				flwname = "You"
			end
			if followed == current_user
				flwdname = "You"
			end

			"#{flwname} followed #{flwdname}"
			# end

		elsif act.action_type == "Lesson"

			les = Lesson.find(act.action_id)
			explorer = User.find(les.user_id)
			expname = explorer.name
			cat = Category.find(les.category_id)

			if current_user == explorer
				expname = "You"	
			end
			"#{expname} go into #{cat.title}"
		end
	end

	def activity_man(act)
		if act.action_type == "Relationship"

			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)

			image_tag("#{follower.image}", class: "avator_style")

		elsif act.action_type == "Lesson"

			les = Lesson.find(act.action_id)
			explorer = User.find(les.user_id)

			image_tag("#{explorer.image}", class: "avator_style")
		end
	end

	def doyouknow_actor(act,user)
		if act.action_type == "Relationship"
			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)
			followed = User.find(rela.followed_id)
			if user.following?(follower) || user.following?(followed)
				return true
			end
		else
			les = Lesson.find(act.action_id)
			explorer = User.find(les.user_id)
			if user.following?(explorer)
				return true
			end
		end
	end
	def whoareyou(act,user)
		if act.action_type == "Relationship"
			rela = Relationship.find(act.action_id)
			follower = User.find(rela.follower_id)
			followed = User.find(rela.followed_id)
			if follower == user || followed == user
				return true
			end
		else
			les = Lesson.find(act.action_id)
			explorer = User.find(les.user_id)
			if user == explorer
				return true
			end
		end
	end
end

