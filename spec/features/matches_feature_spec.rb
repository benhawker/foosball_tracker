require 'rails_helper'

feature 'matches' do
  context 'no matches have been added' do
    scenario 'should display a prompt to add a match' do
      visit '/matches'
      expect(page).to have_link 'Add new match'
    end
  end

  context 'creating, viewing, editing & deleting matches' do

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

      def user_three
        visit '/users'
        click_link 'Add a user'
        fill_in 'user[first_name]', with: 'three'
        fill_in 'user[user_name]', with: 'three'
        click_button 'Create user'
      end

      def user_four
        visit '/users'
        click_link 'Add a user'
        fill_in 'user[first_name]', with: 'four'
        fill_in 'user[user_name]', with: 'four'
        click_button 'Create user'
      end

      def team_one
        visit '/teams'
        click_link 'Add new team'
        select('one', :from => 'team[player_one]')
        select('two', :from => 'team[player_two]')
        click_button "Create Team!"
      end

      def team_two
        visit '/teams'
        click_link 'Add new team'
        select('three', :from => 'team[player_one]')
        select('four', :from => 'team[player_two]')
        click_button "Create Team!"
      end

      before do
        user_one
        user_two
        user_three
        user_four
        team_one
        team_two
      end

    scenario 'display the most recent matches at matches index' do
      visit '/matches'
      click_link 'Add new match'
      select('one two', :from => 'match[team_one]')
      select('three four', :from => 'match[team_two]')
      select('0', :from => 'match[team_one_score]')
      select('10', :from => 'match[team_two_score]')
      click_button 'Create Match!'
      expect(page).to have_content('Here are the most recent matchups')
      expect(page).not_to have_content('No matches yet')
    end

    scenario 'prompts user to fill out a form, then displays the new match up' do
      visit '/matches'
      click_link 'Add new match'
      select('one two', :from => 'match[team_one]')
      select('three four', :from => 'match[team_two]')
      select('0', :from => 'match[team_one_score]')
      select('10', :from => 'match[team_two_score]')
      click_button 'Create Match!'
      expect(page).to have_content 'Match created successfully'
      expect(current_path).to eq '/matches'
    end

    # Struggling to target these links with XPATH or CSS.
    
    # scenario 'user can delete the matchup' do
    #   visit '/matches'
   #    click_link "Delete Match"
    #   expect(page).to have_content 'Match deleted successfully'
    # end

    # scenario 'user can edit the matchup' do
    #   visit '/matches'
   #    click_link "Edit Match"
   #    select('0', :from => 'match[team_one_score]')
   #    select('10', :from => 'match[team_two_score]')
   #    click_button "Edit Match!"
    #   expect(page).to have_content 'Match updated successfully'
    # end

    # scenario 'user can view the matchup in detail' do
    #   visit '/matches'
   #    within("/html/body/div[2]/table/tbody/tr/td[1]/a") do
   #      click_link "View Match Stats"
   #    end
    #   expect(page).to have_content 'Match stats'
    # end
  end

  end