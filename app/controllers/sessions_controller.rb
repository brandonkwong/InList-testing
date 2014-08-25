class SessionsController < ApplicationController
	def new

	end

	
	def create
		user = User.where(email: params[:user][:email]).first
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id.to_s
			redirect_to root_path
		else
			redirect_to welcome_path
		end
	end

	def destroy
		reset_session
		redirect_to welcome_path
	end
end
