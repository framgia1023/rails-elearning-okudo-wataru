class RelationshipsController < ApplicationController



	def create
		@user = User.find(params[:followed_id])

		new_ship = Relationship.new(
			follower_id: current_user.id,
			followed_id: @user.id
		)
		if new_ship.save
			new_ship.create_activity
			# current_user.follow(@user)
			redirect_to request.referrer
		else
			redirect_to users
		end
	end



	def destroy
		@user = Relationship.find(params[:id]).followed

		del_ship = Relationship.find_by(follower: current_user.id, followed:@user.id)
		del_act = Activity.find_by(action_type: "Relationship", action_id: del_ship.id)

		del_ship.destroy
		del_act.destroy
		
		#current_user.unfollow(@user)
		redirect_to request.referrer
	end


end
