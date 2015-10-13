require 'rails_helper'

feature 'teams' do
	before { User.create(first_name: 'Ben', 
			    						last_name: 'Hawker',
			    						user_name: 'benhawker'
			    						) }

  scenario 'allows users to create a team made up of existing users' do
		visit '/teams'
		click_link 'Add new team'
		select('Ben', :from => 'team[player_one]')
		select('Ben', :from => 'team[player_two]')
		click_button "Create Team!"
		expect(page).to have_content "Team created successfully"
		expect(current_path).to eq '/teams'
  end
end
