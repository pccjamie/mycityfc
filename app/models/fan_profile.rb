class FanProfile < ActiveRecord::Base

	has_and_belongs_to_many :teams
	
	has_many :users, :as => :profilable

end
