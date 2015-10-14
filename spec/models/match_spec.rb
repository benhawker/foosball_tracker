require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:teams) }

  
end
