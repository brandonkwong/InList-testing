class SessionsController < ApplicationController
	def new
		@user = User.new
		if current_user_path
			redirect_to current_user_path
		else
			redirect_to index_path
	end

	
	def create
		user = User.where(email: params[:user][:email]).first
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id.to_s
			redirect_to current_user_path
		else
			redirect_to index_path
		end
	end

	def destroy
		reset_session
		redirect_to index_path
	end
end
