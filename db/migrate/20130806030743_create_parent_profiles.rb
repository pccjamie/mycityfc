class CreateParentProfiles < ActiveRecord::Migration
  def change
    create_table :parent_profiles do |t|

      t.timestamps
    end
  end
end
