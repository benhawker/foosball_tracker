class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.teams << Team.find(params[:match][:team_one])
    @match.teams << Team.find(params[:match][:team_two])
    @match.winner?
    @match.assign_winner
    @match.team_wins
    if @match.save
      flash[:notices] = ['Match created successfully']
      redirect_to '/matches'
    else
      flash[:alerts] = @match.errors.messages[:base]
      render 'new'
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:notices] = ['Match updated successfully']
      redirect_to '/matches'
    else
      flash[:alerts] = ["The winner must have 10 goals"]
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.decrease_team_win_count_when_match_deleted
    if @match.destroy
      flash[:notices] = ['Match deleted successfully']
      redirect_to '/matches'
    else
      flash[:alerts] = ['Sorry something went wrong. Your match was not deleted.']
      redirect_to '/edit'
    end
  end

  def match_params
    params.require(:match).permit(:team_one, 
                                  :team_two, 
                                  :best_of, 
                                  :team_one_score, 
                                  :team_two_score, 
                                  :winning_team)
  end
end

