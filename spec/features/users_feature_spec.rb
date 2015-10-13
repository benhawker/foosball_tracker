require 'rails_helper'

feature 'users' do
  context 'no users have been added' do
    scenario 'should display a prompt to add a user' do
      visit '/users'
      expect(page).to have_content 'No users yet'
      expect(page).to have_link 'Add a user'
    end
  end

  context 'users have been added' do
	  before do
	    User.create(first_name: 'Ben', 
	    						last_name: 'Hawker',
	    						user_name: 'benhawker'
	    						)
	  end

	  scenario 'display users' do
	    visit '/users'
	    expect(page).to have_content('Ben')
	    expect(page).not_to have_content('No users yet')
	  end
	end

	context 'creating users' do
	  scenario 'prompts user to fill out a form, then displays the new user' do
	    visit '/users'
	    click_link 'Add a user'
	    fill_in 'user[first_name]', with: 'Ben'
	   	fill_in 'user[last_name]', with: 'Hawker'
	   	fill_in 'user[user_name]', with: 'benhawker'
	    click_button 'Create user'
	    expect(page).to have_content 'Ben'
	    expect(current_path).to eq '/users'
	  end
	end

	context 'viewing restaurants' do

	  let!(:ben){ User.create(first_name: 'Ben', 
						    						last_name: 'Hawker',
						    						user_name: 'benhawker'
						    						) }

	  scenario 'lets a user view a user' do
	   visit '/users'
	   click_link 'benhawker'
	   expect(page).to have_content 'Ben Hawker'
	   expect(current_path).to eq "/users/#{ben.id}"
	  end
	end

	context 'editing restaurants' do

	  before { User.create(first_name: 'Ben', 
				    						last_name: 'Hawker',
				    						user_name: 'benhawker'
				    						) }

	  scenario 'let a user edit a user' do
			visit '/users'
			click_link 'Edit benhawker'
			fill_in 'user[first_name]', with: 'Bob'
	   	fill_in 'user[last_name]', with: 'Smith'
	   	fill_in 'user[user_name]', with: 'bobsmith'
			click_button 'Update user'
			expect(page).to have_content 'Bob Smith'
			expect(current_path).to eq '/users'
		end
	end

	context 'deleting restaurants' do

	  before { User.create(first_name: 'Ben', 
				    						last_name: 'Hawker',
				    						user_name: 'benhawker'
				    						) }

	  scenario 'removes a user when a user clicks a delete link' do
	    visit '/users'
	    click_link 'Delete benhawker'
	    expect(page).not_to have_content 'Ben Hawker'
	    expect(page).to have_content 'User deleted successfully'
	  end
	end
end