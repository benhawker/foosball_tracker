require 'rails_helper'

feature 'users' do
  context 'no users have been added' do
    scenario 'should display a prompt to add a user' do
      visit '/users'
      expect(page).to have_content 'No users yet'
      expect(page).to have_link 'Add a user'
    end
  end
end