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

  def show
  	@user = User.find(params[:id])
 	end

 	def edit
 		@user = User.find(params[:id])
 	end

 	def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to '/users'
    else
      flash[:alert] = "User could not be updated"
      render 'edit'
    end
  end

 	def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name)
  end
end
