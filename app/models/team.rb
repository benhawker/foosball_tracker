class Team < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }
  has_and_belongs_to_many :matches, -> { uniq }

  validates :player_one, presence: true
  validates :player_one, uniqueness: { scope: :player_two }
  validates :player_two, uniqueness: { scope: :player_one }

  before_save :set_team_wins
    def set_team_wins
      if self.wins != nil
        self.wins = 0 if self.wins < 0
        self.wins = 0 if self.wins < 0
      end
    end

  def matches_played
    self.matches.count
  end

  def matches_lost
    matches_played - self.wins.to_i
  end

  def team_win_percentage
    ((self.wins.to_f / matches_played) * 100).round(2)
  end

  def self.sorted_by_percentage_correct
    Team.all.sort_by(&:team_win_percentage).reverse
  end

  #View helpers
  def team_player_one
    self.users.first.first_name
  end

  def team_player_two
    self.users.last.first_name unless self.users.first.first_name == self.users.last.first_name
  end
end
