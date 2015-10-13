class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :matches

	validates :player_one, length: {minimum: 1}
end
