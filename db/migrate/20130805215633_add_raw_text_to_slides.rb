class AddRawTextToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :data, :text
  end
end
