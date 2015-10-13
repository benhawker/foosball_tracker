require 'rails_helper'

feature 'matches' do
  context 'no macthes have been added' do
    scenario 'should display a prompt to add a match' do
      visit '/matches'
      expect(page).to have_content 'No matches yet'
      expect(page).to have_link 'Add new match'
    end
  end

  # context 'users have been added' do
	 #  before do
	 #    User.create(first_name: 'Ben', 
	 #    						last_name: 'Hawker',
	 #    						user_name: 'benhawker'
	 #    						)
	 #  end

	 #  scenario 'display users' do
	 #    visit '/users'
	 #    expect(page).to have_content('Ben')
	 #    expect(page).not_to have_content('No users yet')
	 #  end
	end