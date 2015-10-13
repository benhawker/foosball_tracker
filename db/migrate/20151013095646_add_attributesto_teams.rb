class AddAttributestoTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :player_one, :string
  	add_column :teams, :player_two, :string
  	add_column :teams, :wins, :integer, default: 0
  	add_column :teams, :win_percentage, :float, default: 0.0
  end
end
