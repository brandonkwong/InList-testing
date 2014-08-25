class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # Prepare to show the sign-up form
  def new
    @user = User.new
    @is_signup = true
  end
  # Actually build the user
  def create
    
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      if @user.save 
        session[:user_id] = @user.id.to_s
        redirect_to mains_path
      else
      redirect_to new_user_path @user
  end
end

  def show
  end

  def edit
  end
  def update
  end

  def destroy
    User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
#    User.find_by(id: params[:id])
    redirect_to users_path
  end
end




