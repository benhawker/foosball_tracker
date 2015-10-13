class UsersController < ApplicationController
	def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:notice] = 'User created successfully'
    	redirect_to users_path
    else
    	render 'new'
    end
  end  

 	def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name)
  end
end
