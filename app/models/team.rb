class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :matches

	validates :player_one, presence: true
	validates :player_one, uniqueness: { scope: :player_two }
	validates :player_two, uniqueness: { scope: :player_one }

	def team_win_percentage
		((Team.wins.to_f / Team.matches.count) * 100).round(2)
	end

	#View helpers
	def team_player_one
		self.users.first.first_name
	end

	def team_player_two
		self.users.last.first_name unless self.users.first.first_name == self.users.last.first_name
	end
end
