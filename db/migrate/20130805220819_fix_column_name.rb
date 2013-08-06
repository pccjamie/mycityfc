class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :slides, :image_url, :data_url
  end
end
