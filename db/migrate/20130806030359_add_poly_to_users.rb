class AddPolyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :profilable_id, :integer
  	add_column :users, :profilable_type, :string
  end
end
