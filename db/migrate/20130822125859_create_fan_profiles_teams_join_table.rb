class CreateFanProfilesTeamsJoinTable < ActiveRecord::Migration
  def change
  	create_table :fan_profiles_teams, :id => false do |t|
  	 t.integer :fan_profiles_id
     t.integer :team_id
  	end
  end
end
