class CreateFanProfiles < ActiveRecord::Migration
  def change
    create_table :fan_profiles do |t|

      t.timestamps
    end
  end
end
