class Match < ActiveRecord::Base
	has_and_belongs_to_many :teams

		attr_accessor :assign_winner, :team_wins

		def winner?
			return team_one if team_one_score == 10
			return team_two if team_two_score == 10
			nil
		end

		def assign_winner
			self.update(winning_team: winner?)
		end

		def team_wins
			Team.increment_counter(:wins, winning_team.to_s)
		end
end
