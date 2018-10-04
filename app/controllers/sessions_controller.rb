class SessionsController < ApplicationController

	def new

	end

	def create
		 user = User.find_by(email: params[:session][:email])
		 if user && user.authenticate(params[:session][:password])
		 	session[:user_id] = user.id
			#flash[:success] = "successfully Logged in" #flash.nowにするとすぐにページが切り替わり表示されない
		 	redirect_to root_url
		 else
			#flash.now[:danger] = "Invalid Credentials"
		 	render "new"
		 end
	end

	def destroy
		logout
		redirect_to root_url
	end
end
