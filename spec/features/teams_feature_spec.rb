require 'rails_helper'

feature 'teams' do
	
	context 'no teams have been added' do
    scenario 'should display a prompt to add a team' do
      visit '/teams'
      expect(page).to have_content 'No teams yet'
      expect(page).to have_link 'Add new team'
    end
  end

	context 'teams have been added' do

		before { User.create(first_name: 'Ben', 
				    						last_name: 'Hawker',
				    						user_name: 'benhawker'
				    						) }

		before { User.create(first_name: 'Bob', 
				    						last_name: 'Smith',
				    						user_name: 'bobsmith'
				    						) }

	  scenario 'allows users to create a team made up of existing users' do
			visit '/teams'
			click_link 'Add new team'
			select('Ben', :from => 'team[player_one]')
			select('Bob', :from => 'team[player_two]')
			click_button "Create Team!"
			expect(page).to have_content "Team created successfully"
			expect(current_path).to eq '/teams'
	  end

	  scenario 'allows users to view existing teams' do
			visit '/teams'
			click_link 'Add new team'
			select('Ben', :from => 'team[player_one]')
			select('Bob', :from => 'team[player_two]')
			click_button "Create Team!"
			click_link "View Team"
			expect(page).to have_content "Ben"
			expect(page).to have_content "Bob"
	  end
	end

	context 'deleting teams' do
		def user_one
				visit '/users'
		    click_link 'Add a user'
		    fill_in 'user[first_name]', with: 'one'
		   	fill_in 'user[user_name]', with: 'one'
		    click_button 'Create user'
		 	end

		 	def user_two
				visit '/users'
		    click_link 'Add a user'
		    fill_in 'user[first_name]', with: 'two'
		   	fill_in 'user[user_name]', with: 'two'
		    click_button 'Create user'
		 	end

		 	def team_one
			 	visit '/teams'
				click_link 'Add new team'
				select('one', :from => 'team[player_one]')
				select('two', :from => 'team[player_two]')
				click_button "Create Team!"
			end

		 	before do
			 	user_one
			 	user_two
			 	team_one
		 	end

	  # scenario 'removes a team when a user clicks a delete link' do
	  #   visit '/teams'
	  #   click_link 'Delete'
	  #   expect(page).not_to have_content 'Ben'
	  #   expect(page).not_to have_content 'Bob'
	  #   expect(page).to have_content 'Team deleted successfully'
	  # end
	end

end
