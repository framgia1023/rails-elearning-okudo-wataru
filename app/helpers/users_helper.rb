module UsersHelper

	def show_avator(user)
		if user.image?
			image_tag("#{user.image}")
		else
			image_tag("/avator1.png")
		end
	end

end

