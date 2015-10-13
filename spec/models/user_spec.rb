require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_and_belong_to_many(:teams) }

  it 'is not valid without a username of minimum 3 chars' do
    user = User.new(user_name: "")
    expect(user).to have(1).error_on(:user_name)
    expect(user).not_to be_valid
  end

  it "is not valid unless it has a unique username" do
	  User.create(user_name: "benhawker")
	  user = User.new(user_name: "benhawker")
	  expect(user).to have(1).error_on(:user_name)
	end
end
