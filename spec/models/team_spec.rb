require 'rails_helper'

RSpec.describe Team, type: :model do
 it { should have_and_belong_to_many(:users) }
 it { should have_and_belong_to_many(:matches) }

  it 'is not valid without a player_one' do
    team = Team.new(player_one: "")
    expect(team).to have(1).error_on(:player_one)
    expect(team).not_to be_valid
  end

end
