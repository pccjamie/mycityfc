class AddPrimaryTeamToFanProfiles < ActiveRecord::Migration
  def change
    add_column :fan_profiles, :name, :string
  end
end
