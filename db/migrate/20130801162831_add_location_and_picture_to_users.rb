class AddLocationAndPictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :picture, :string
  end
end
