class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def new
	  @team = Team.new
	end

	def create
    @team = Team.new(user_params)
    if @team.save
    	flash[:notice] = 'Team created successfully'
    	redirect_to teams_path
    else
    	render 'new'
    end
  end

  def show
  	@team = Team.find(params[:id])
 	end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:notice] = 'Team deleted successfully'
      redirect_to '/teams'
    else
      flash[:alert] = 'Sorry something went wrong. The team was not deleted.'
      redirect_to '/teams'
    end
  end

 	def user_params
    params.require(:team).permit(:player_one, :player_two, 
    														:wins, :win_percentage)
  end

end
