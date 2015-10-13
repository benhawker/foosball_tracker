class AddAttributesToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :team_one, :string
  	add_column :matches, :team_two, :string
  	add_column :matches, :team_one_score, :integer
  	add_column :matches, :team_two_score, :integer
  	add_column :matches, :winning_team, :string
  end
end
