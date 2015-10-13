require 'rails_helper'

feature 'matches' do
  context 'no macthes have been added' do
    scenario 'should display a prompt to add a match' do
      visit '/matches'
      expect(page).to have_content 'No matches yet'
      expect(page).to have_link 'Add new match'
    end
  end

  context 'matches have been added' do
	  before do
	    Match.create(team_one: 'Team 1', 
	    						team_two: 'Team 2',
	    						team_one_score: '10',
	    						team_two_score: '0'
	    						)
	  end

	  scenario 'display matches' do
	    visit '/matches'
	    expect(page).to have_content('Team 1 vs. Team 2')
	    expect(page).not_to have_content('No matches yet')
	  end
	end

	context 'creating matches' do
		 	let!(:bob){ User.create(user_name: 'bob') }
		 	let!(:ben){ User.create(user_name: 'ben') }
		 	let!(:bill){ User.create(user_name: 'bill') }
		 	let!(:joe){ User.create(user_name: 'joe') }

		 	let!(:team_one){ Team.create(player_one: bob, player_two: ben) }
	  	let!(:team_two){ Team.create(player_one: bill, player_two: joe) }

	  scenario 'prompts user to fill out a form, then displays the new match up' do
	    visit '/match'
	    click_link 'Add new match'
	    fill_in 'match[team_one]', with: 'bob & ben'
	   	fill_in 'match[team_two]', with: 'bill & joe'
	    click_button 'Create match'
	    expect(page).to have_content ''
	    expect(current_path).to eq '/users'
	  end
	end

	end