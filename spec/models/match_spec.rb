require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:teams) }

  it 'the match combination must be unique' do
		ben = User.create(user_name: "ben")
		bob = User.create(user_name: "bob")
		joe = User.create(user_name: "joe")
		moll = User.create(user_name: "moll")
	  team_1 = Team.create(player_one: ben, player_two: bob)
	  team_2 = Team.create(player_one: joe, player_two: moll)
    Match.create(team_one: team_1, team_two: team_2)
    match = Match.create(team_one: team_1, team_two: team_2)
	  expect(match).to have(1).error_on(:team_one)
	  expect(team).not_to be_valid
	end
end
