class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :logo
      t.string :league
      t.string :address
      t.string :city
      t.string :state
      t.string :venue
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
