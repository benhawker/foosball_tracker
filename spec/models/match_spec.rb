require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:teams) }

  it 'is not valid without 2 teams' do
  	ben = User.create(user_name: "ben")
		bob = User.create(user_name: "bob")
		team_1 = Team.create(player_one: ben, player_two: bob)
   	match = Match.create(team_one: team_1, team_two: "")
    expect(match).to have(1).error_on(:team_two)
    expect(match).not_to be_valid
  end
end
