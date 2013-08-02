class AddSlideNumberToSlides < ActiveRecord::Migration
  	def change
    	add_column :slides, :slide_number, :integer
	end
end
