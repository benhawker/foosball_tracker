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

		def decrease_team_win_count_when_match_deleted
			Team.decrement_counter(:wins, winning_team.to_s)
		end

		#View helpers

		def team_one_player_one
			self.teams.find(self.team_one).users.first.first_name
		end

		def team_one_player_two
			self.teams.find(self.team_one).users.last.first_name
		end

		def team_two_player_one
			self.teams.find(self.team_two).users.first.first_name
		end

		def team_two_player_two
			self.teams.find(self.team_two).users.last.first_name
		end

		def match_winner
			if self.winner? == self.team_one
				return "#{self.teams.find(self.team_one).users.first.first_name} & #{self.teams.find(self.team_one).users.last.first_name}"
			else
				return "#{self.teams.find(self.team_two).users.first.first_name} & #{self.teams.find(self.team_two).users.last.first_name}"
			end
		end
end
