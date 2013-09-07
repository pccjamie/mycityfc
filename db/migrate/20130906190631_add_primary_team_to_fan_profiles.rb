class AddPrimaryTeamToFanProfiles < ActiveRecord::Migration
  def change
    add_column :fan_profiles, :primary_team, :string
  end
end
