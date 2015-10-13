require 'rails_helper'

feature 'home' do
  context 'user visits the home page' do
    scenario 'should display a ranking of registered teams by match wins' do
      visit '/'
      expect(page).to have_content 'View the leaderboard'
    end
  end
end