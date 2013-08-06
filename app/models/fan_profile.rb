class FanProfile < ActiveRecord::Base

	has_many :users, :as => :profilable

end
