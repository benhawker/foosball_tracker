class AddAttributestoTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :player_one, :string
  	add_column :teams, :player_two, :string
  	add_column :teams, :wins, :integer
  	add_column :teams, :win_percentage, :float
  end
end
