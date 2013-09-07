class AddPrimaryTeamToUser < ActiveRecord::Migration
  def change
    add_column :users, :primary_team, :string
  end
end
