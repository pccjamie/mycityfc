class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :name
      t.string :desc
      t.string :url
      t.string :image_url
      t.string :cite

      t.timestamps
    end
  end
end
