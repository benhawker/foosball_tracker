class User < ActiveRecord::Base
  has_and_belongs_to_many :teams

  validates :user_name, length: {minimum: 3}, uniqueness: true

  #View Helpers
  def user_one
    self.users.first.first_name
  end

  def team_player_two
    self.users.last.first_name unless self.users.first.first_name == self.users.last.first_name
  end
end
