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

	def show_man(act)
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

	def count_defeat(act)
		lesson = Lesson.find(act.action_id)
		correct_num = lesson.choices.collect{|i| i.correct || nil}.compact.size
		all_num = lesson.category.words.collect{|i| i.id}.size

		"defeat #{correct_num}/#{all_num} enemies"
	end

end

