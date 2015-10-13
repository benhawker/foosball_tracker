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

 	def user_params
    params.require(:team).permit(:player_one, :player_two, 
    														:wins, :win_percentage)
  end
  
end
