require 'rails_helper'

RSpec.describe Team, type: :model do
 it { should have_and_belong_to_many(:users) }
 it { should have_and_belong_to_many(:matches) }

  it 'is not valid without a player_one' do
    team = Team.new(player_one: "")
    expect(team).to have(1).error_on(:player_one)
    expect(team).not_to be_valid
  end

  it 'the team combination must be unique' do
  	ben = User.create(user_name: "ben")
  	bob = User.create(user_name: "bob")
    Team.create(player_one: ben, player_two: bob)
    team = Team.create(player_one: ben, player_two: bob)
    expect(team).to have(1).error_on(:player_two)
    expect(team).not_to be_valid
  end

end
