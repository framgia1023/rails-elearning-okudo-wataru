class RelationshipsController < ApplicationController



	def create
		@user = User.find(params[:followed_id])

		new_ship = Relationship.new(
			follower_id: current_user.id,
			followed_id: @user.id
		)
		if new_ship.save
			# current_user.follow(@user)
			redirect_to request.referrer
		else
			redirect_to users
		end
	end



	def destroy
		@user = Relationship.find(params[:id]).followed

		del_ship = Relationship.find_by(follower: current_user.id, followed:@user.id)

		del_ship.destroy
		
		#current_user.unfollow(@user)
		redirect_to request.referrer
	end


end
